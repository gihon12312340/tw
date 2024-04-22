// JavaScript Document

// 依頁籤數量添加不同class樣式 最多只能有3個
$(function(){
	var tabQuantity = $(".indexActBg ul.tabs li").length;				//取得頁籤數量
	
	for ( n=1; n<7; n++ ) {
		if ( tabQuantity == n ) {
			$(".indexActBg .img-scroll").addClass("img-scroll"+n);
		}
	}

	//----------------------------------頁籤變下拉選單特效----------------------------------
	if ( tabQuantity>1 || tabQuantity==null ) {				//如果頁籤數大於1或沒有
		$(".indexActBg .tabs_btn_now").click(function(e) {
			$(".indexActBg .img-scroll").slideToggle();
			e.stopPropagation();
		});
	}
	
	if ( tabQuantity==1 ) {									//如果頁籤只有一個
		$(".indexActBg .tabs_btn_now_arrow").hide();
	}
	
	
	// 電腦板-點擊頁籤轉換類別用
	$(".indexActBg .tabs li span").click(function(e) {
		var tabsText = $(this).text();
		var bodywidth=document.documentElement.clientWidth;//取得螢幕可見寬度
		
		$(".indexActBg .tabs_btn_now span").replaceWith('<span>'+tabsText+'</span>');
		// if ( bodywidth <= 1023 ) {
		// 	$(".img-scroll").slideToggle();
		// }
		e.stopPropagation();
	});
});

$(window).resize(function(e) {
	$(".indexActBg .img-scroll").removeAttr("style");
});




$(function(){
	// 預設顯示第一個 Tab
	var _showTab = 0;
	var $defaultLi = $('.indexActBg ul.tabs li span').eq(_showTab).addClass('active');
	//↑原本為var $defaultLi = $('ul.tabs li').eq(_showTab).addClass('active');
	$($defaultLi.attr('href')).siblings().hide();
	
	// 當 li 頁籤被點擊時...
	// 若要改成滑鼠移到 li 頁籤就切換時, 把 click 改成 mouseover
	$('.indexActBg ul.tabs li span').click(function() {
	//↑原本為$('ul.tabs li').click(function() {
		// 找出 li 中的超連結 href(#id)
		var $this = $(this),
			_clickTab = $this.attr('href');
		// 把目前點擊到的 li 頁籤加上 .active
		// 並把兄弟元素中有 .active 的都移除 class
		$this.parent().addClass('active').siblings('.active').removeClass('active');
		//↑原本無.parent()
		// 淡入相對應的內容並隱藏兄弟元素
		$(_clickTab).stop(false, true).fadeIn().siblings().hide();

		return false;
	}).find('a').focus(function(){
		this.blur();
	});
});
