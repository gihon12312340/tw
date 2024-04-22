// JavaScript Document

// 依頁籤數量添加不同class樣式 最多只能有3個
$(function(){
	var tabQuantity = $("ul.tabs li").length;				//取得頁籤數量
	
	for ( n=1; n<7; n++ ) {
		if ( tabQuantity == n ) {
			$(".img-scroll").addClass("img-scroll"+n);
		}
	}

	//----------------------------------頁籤變下拉選單特效----------------------------------
	if ( tabQuantity>1 || tabQuantity==null ) {				//如果頁籤數大於1或沒有
		$(".tabs_btn_now").click(function(e) {
			$(".img-scroll").slideToggle();
			e.stopPropagation();
		});
	}
	
	if ( tabQuantity==1 ) {									//如果頁籤只有一個
		$(".tabs_btn_now_arrow").hide();
	}
	
	
	// 電腦板-點擊頁籤轉換類別用
	$(".tabs li span").click(function(e) {
		var tabsText = $(this).text();
		var bodywidth=document.documentElement.clientWidth;//取得螢幕可見寬度
		
		$(".tabs_btn_now span").replaceWith('<span>'+tabsText+'</span>');
		// if ( bodywidth <= 1023 ) {
		// 	$(".img-scroll").slideToggle();
		// }
		e.stopPropagation();
	});
});

$(window).resize(function(e) {
	$(".img-scroll").removeAttr("style");
});




$(function(){
	// 預設顯示第一個 Tab
	var _showTab = 0;
	var $defaultLi = $('ul.tabs li span').eq(_showTab).addClass('active');
	//↑原本為var $defaultLi = $('ul.tabs li').eq(_showTab).addClass('active');
	$($defaultLi.attr('href')).siblings().hide();
	
	// 當 li 頁籤被點擊時...
	// 若要改成滑鼠移到 li 頁籤就切換時, 把 click 改成 mouseover
	$('ul.tabs li span').click(function() {
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


// =================================================================================


// 第二祖頁籤
// JavaScript Document

// 依頁籤數量添加不同class樣式 最多只能有3個
$(function(){
	var tabQuantity2 = $("ul.tabs2 li").length;				//取得頁籤數量
	
	for ( n=1; n<6; n++ ) {
		if ( tabQuantity2 == n ) {
			$(".img-scroll2").addClass("img-scroll2"+n);
		}
	}

	//----------------------------------頁籤變下拉選單特效----------------------------------
	if ( tabQuantity2>1 || tabQuantity2==null ) {				//如果頁籤數大於1或沒有
		$(".tabs2_btn_now").click(function(e) {
			e.stopPropagation();
			console.log('11111111111');
			$(".img-scroll2").slideToggle();
			
		});
	}
	
	if ( tabQuantity2==1 ) {									//如果頁籤只有一個
		$(".tabs2_btn_now_arrow").hide();
	}
	

	// 電腦板-點擊頁籤轉換類別用
	$(".tabs2 li span").click(function(e) {
		var tabsText2 = $(this).text();
		var bodywidth=document.documentElement.clientWidth;//取得螢幕可見寬度
		
		$(".tabs2_btn_now span").replaceWith('<span>'+tabsText2+'</span>');
		// if ( bodywidth <= 1023 ) {
		// 	$(".img-scroll2").slideToggle();
		// }
		e.stopPropagation();
	});
});

$(window).resize(function(e) {
	$(".img-scroll2").removeAttr("style");
});




$(function(){
	// 預設顯示第一個 Tab
	var _showTab2 = 0;
	var $defaultLi2 = $('ul.tabs2 li span').eq(_showTab2).addClass('active');
	//↑原本為var $defaultLi_2 = $('ul.tabs2 li').eq(_showTab).addClass('active');
	$($defaultLi2.attr('href')).siblings().hide();
	
	// 當 li 頁籤被點擊時...
	// 若要改成滑鼠移到 li 頁籤就切換時, 把 click 改成 mouseover
	$('ul.tabs2 li span').click(function() {
	//↑原本為$('ul.tabs2 li').click(function() {
		// 找出 li 中的超連結 href(#id)
		var $this2 = $(this),
			_clickTab2 = $this2.attr('href');
		// 把目前點擊到的 li 頁籤加上 .active
		// 並把兄弟元素中有 .active 的都移除 class
		$this2.parent().addClass('active').siblings('.active').removeClass('active');
		//↑原本無.parent()
		// 淡入相對應的內容並隱藏兄弟元素
		$(_clickTab2).stop(false, true).fadeIn().siblings().hide();

		return false;
	}).find('a').focus(function(){
		this.blur();
	});
});