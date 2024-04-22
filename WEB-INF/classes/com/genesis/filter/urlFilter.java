/*
   @version 1.0
   @date 2020/07/01
   @author Miles Chang
*/
package com.genesis.filter;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.genesis.sql.*;

public class urlFilter implements Filter {
	// FilterConfig�i�Ω�X��Filter���t�m��T
	private FilterConfig config;

	// �갵��l��
	public void init(FilterConfig config) {
		this.config = config;
	}

	// �갵�P��
	public void destroy() {
		this.config = null;
	}

	// ����L�o���֤ߤ�k
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// ---------�U���{���X�Ω��ϥΪ̽ШD����w�B�z---------
		// ���ServletContext����A�Ω�O����x
		ServletContext context = this.config.getServletContext();
		long before = System.currentTimeMillis();
		// System.out.println("�}�l�L�o...");
		// �N�ШD�ഫ��HttpServletRequest�ШD
		HttpServletRequest hrequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		String urlPath = hrequest.getServletPath().substring(1); // �Ĥ@�Ӧr��O / 
		String redirectPath = "";
		// �O����x
		context.log("Filter�w�g�I���ϥΪ̪��ШD�a�}�G " + urlPath);
		SqlManager app_sm = new SqlManager();
		
		TableRecord rr = app_sm.select("redirect_record", "rr_code = ? and rr_title = ?",
				new Object[] {"redirect", urlPath});
		if(!"".equals(rr.getString("rr_id"))) {
			redirectPath = rr.getString("rr_url");
			httpResponse.sendRedirect(redirectPath);
			context.log("Filter�w�g���s�ɦV��ϥΪ̪��ШD�a�}�G " + redirectPath);
		}else {
		// 	Filter�u�O�즡�B�z�A�ШD�̵M����ت��a�}
			chain.doFilter(request, response);
		}
		/*
			// ---------�U���{���X�Ω����A���T�������B�z---------
			long after = System.currentTimeMillis();
			// �O����x
			context.log("�L�o����");
			// �A���O����x
			context.log("�ШD�Q�w���" + hrequest.getRequestURI() + "�Ҫ᪺�ɶ���: " + (after - before));
		*/
	}
}