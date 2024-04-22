// JavaScript共用區
//20160921 by kevin

	var winHeight    = $(window).height();          //螢幕高度
	var win_W		 = $(window).width();			//螢幕寬度
	var hederHeight  = $(".header").innerHeight();;	//版頭高度
	var footerHeight = $(".footer").innerHeight();;	//版腳高度

	//浮動式top鍵
	$(window).load(function(){
		$(window).bind('scroll resize', function(){
			var $this = $(this);
			var $this_Top=$this.scrollTop();
			
			//當高度小於100時，關閉區塊 
			if($this_Top < 100){
				$('.topBtn').stop().animate({bottom:"-70px"});
			}
			if($this_Top > 100){
				$('.topBtn').stop().animate({bottom:"200px"});
			}
			
			
			//當高度小於100時，關閉區塊 
			if($this_Top < 100){
				$('.CommunityBtn_area').stop().animate({bottom:"30px"});
			}
			if($this_Top > 100){
				$('.CommunityBtn_area').stop().animate({bottom:"240px"});
			}	
			
			
			//當視窗卷軸滑動時，版頭下緣陰影會有顯示、隱藏的動作
			//當高度小於55時，關閉區塊 
			if($this_Top < 55){
				$('.headerArea').stop().removeClass("fixed");
			}
			if($this_Top > 55){
				$('.headerArea').stop().addClass("fixed");
			}
		}).scroll();
	});
	
	//錨點平滑滾動效果
	$(function(){
		$('a[href*=#]').click(function() {
			if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
				var $target = $(this.hash);
				$target = $target.length && $target || $('[name=' + this.hash.slice(1) + ']');
				if ($target.length) {
					var targetOffset = $target.offset().top;
					$('html,body').animate({
						scrollTop: targetOffset
					},
					1000);
					return false;
				}
			}
		});
	});
	
	//----------------------------------將主體添加最小高度 讓footer置底----------------------------------
	function mainH() {
		winHeight    = $(window).height();
		hederHeight  = $(".header").innerHeight();
		footerHeight = $(".footer").innerHeight();
		
		$(".main").css({
			'min-height': winHeight-hederHeight-footerHeight-0+'px'		//"-30"這要隨每個案子不同調整
		})
	}
	
	mainH();
	
	setTimeout(function(){
		mainH();
	},300)
	
	$(window).resize(function(e) {
		setTimeout(function(){
			mainH();
		},300)
	});
	
	



	
	
	
	//----------------------------------主按鍵收合----------------------------------
	$(function(){
		$(".nav").children("a").click(function(e) {

			$(this).siblings(".navOpen").slideToggle("fast");
			$(".nav").children("a").not(this).siblings(".navOpen").slideUp("fast");
			
			e.stopPropagation();
        });
		
		$(".navOpen").click(function(e) {
            e.stopPropagation();
        });
		
		$(window).click(function(e) {
            $(".navOpen").slideUp("fast");
        });
	});	
	
	
	// $(function(){
	// 	$(".nav").children("a").click(function(e) {
    //         $(this).siblings(".navOpen.mobile").slideToggle("fast");
	// 		$(".nav").children("a").not(this).siblings(".navOpen.mobile").slideUp("fast");
			
	// 		e.stopPropagation();
    //     });
		
	// 	$(".navOpen.mobile").click(function(e) {
    //         e.stopPropagation();
    //     });
		
	// 	$(window).click(function(e) {
    //         $(".navOpen.mobile").slideUp("fast");
    //     });
	// });	



	
	
	//第二層
	$(function(){
		$(".nav_icon.menu_second").click(function(e) {
			$(this).siblings(".navOpenList_open").slideToggle("fast");
			$(".nav_icon.menu_second").not(this).siblings(".navOpenList_open").slideUp("fast");
			
			e.stopPropagation();
		});
		
		//新增主按鍵可點擊 modify by karol 20200924 start
		$(".navOpenList.has_open").children("a").click(function(e) {
			$(this).siblings(".navOpenList_open").slideToggle("fast");
			$(".navOpenList.has_open").not(this).siblings(".navOpenList_open").slideUp("fast");
			
			e.stopPropagation();
		});
		//新增主按鍵可點擊 modify by karol 20200924 end
		
		
		
		
		$(".navOpenList_opene").click(function(e) {
			e.stopPropagation();
		});
		
		$(window).click(function(e) {
			$(".navOpenList_open").slideUp("fast");
		});
	});	











	
	
	//----------------------------------主按鍵收合----------------------------------
	// $(function(){
	// 	$(".nav").children(".navTop").children(".NavListArrowTop").click(function(e) {
    //        // $(this).parent().siblings(".navOpen.mobile").slideToggle("fast");
	// 		$(".nav").children(".navTop").children(".NavListArrowTop").not(this).parent().siblings(".navOpen.mobile").slideUp("fast");
			
	// 		e.stopPropagation();
    //     });
		
	// 	$(".navOpen.mobile").click(function(e) {
    //         e.stopPropagation();
    //     });
		
	// 	$(window).click(function(e) {
    //         $(".navOpen.mobile").slideUp("fast");
    //     });
		
		
	// 	//nav手機箭頭
	// 	if ( win_W <= 990 ) {

	// 		$(".nav").children("a").click(function(e) {
	// 			$(this).parent().toggleClass("show");
	// 			$(".nav").children("a").not(this).siblings().parent().removeClass("show");
	// 			e.stopPropagation();
	// 		});

	// 	}
	
	// });		
	
	
	
	
	
	
	//----------------------------------手機版主按鍵收合----------------------------------
	$(function(){
		$(".menu_btn").click(function(e) {
            $(this).toggleClass("active");
			$(".headerRight").toggleClass("active");
			$("body").toggleClass("active");
			e.stopPropagation();
        });
		
		$(window).resize(function(e) {
			var win_W		 = $(window).width();			//螢幕寬度
            if ( win_W > 990 ) {
				$(".headerRight").removeClass("active");
				$("body").removeClass("active");
				$(".menu_btn").removeClass("active");
			}
        });
		
		$(".headerRight").click(function(e) {
            e.stopPropagation();
        });
		
		$(window).click(function(e) {
            $(".headerRight").removeClass("active");
			$("body").removeClass("active");
			$(".menu_btn").removeClass("active");
        });
	});	
	
	
	
	

	
	

	
	
	
	
	//----------------------------------手機板左選單收合----------------------------------
	$(function(){
		$(".leftList_tit").click(function(e) {		
			if ( $(window).width() <= 990 ) { // Eric修改-手機版時才有收合效果 860隨每個案子修改
			$(this).toggleClass("active");
				
				$(".leftListArea").slideToggle("slow");
				$("body").toggleClass("active");
				e.stopPropagation();
            }
        });
        

		//  Eric 20190529修改 判斷當前左選單是否為手機版
		var mobile_left = false;
		$(window).load(function(){
			if ( $(window).width() <= 990 ) { 
				mobile_left = true;
            }
		});
        // Eric 20180314 返回pc時 左選單選單回覆展開狀態 20190529修改
       	$(window).resize(function(e) {
			//  860隨每個案子修改
			if ( $(window).width() > 990 ) { 
				$(".leftList_tit").removeClass("active");
				$(".leftListArea").show();
				$("body").removeClass("active");
				mobile_left = false;
			}
			// Eric修改-手機版時才有收合效果 860隨每個案子修改 
			if ( $(window).width() <= 990) { 
				if(!mobile_left){ // Eric 20190529 增加判斷當前左選單是否為手機版
					$(".leftListArea").hide();
				}
				mobile_left = true;
				/*$(this).toggleClass("active");*/
				/*$(".leftListArea").slideToggle("slow");*/
				/*$("body").toggleClass("active");*/
            }
			e.stopPropagation();
     	});

	
	});

	
	
	//----------------------------------左選單第二層收合----------------------------------
	// $(function(){
	// 	$(".leftList").children("a").click(function(e) {
	// 		$(".leftList").children("a").not(this).parent(".leftList").removeClass("active");
	// 		$(this).parent(".leftList").toggleClass("active");
			
	// 		$(".leftList").children("a").not(this).siblings(".leftList_open").slideUp();
    //         $(this).siblings(".leftList_open").slideToggle();
    //     });		
		
	// })	
			
	
	

	//----------------------------------左選單第二層收合----------------------------------
	$(function(){
		$(".leftList_Add").click(function(e) {
			
			$(this).parent().parent(".leftList.leftList2").toggleClass("active");
			$(".leftList_Add").not(this).parent().parent(".leftList.leftList2").removeClass("active");
			
			$(".leftList_Add").not(this).parent().siblings(".leftList_open").slideUp();
            $(this).parent().siblings(".leftList_open").slideToggle();
        });		
		
	})	

	//----------------------------------左選單第三層收合----------------------------------
	$(function(){
		$(".leftList_Add2").click(function(e) {
			
			$(this).parent(".leftList_openIn").parent(".leftList_open_list").toggleClass("active");
			$(".leftList_Add2").not(this).parent().parent(".leftList_open_list").removeClass("active");
			
			$(".leftList_Add2").not(this).parent(".leftList_openIn").siblings(".leftList_open_list ul").slideUp();
            $(this).parent().siblings(".leftList_open_list ul").slideToggle();
        });		
		
	})		

	
	


	
	
	//----------------------------------會員登入----------------------------------
//	$(function(){
//		$(".login_open").click(function(e) {
//            $(".member_login_area").addClass("show");
//        });
//		$(".member_login_area").click(function(e) {
//            $(this).removeClass("show");
//        });
//		$(".mL_close").click(function(e) {
//            $(".member_login_area").removeClass("show");
//        });
//		$(".mL_info").click(function(e) {
//            e.stopPropagation();
//        });
//	});	
	
	
	


	
	
	
	
	
	

		

		
	//----------------------------------footer主按鍵收合效果----------------------------------
	$(document).ready(function(e) {
		
		$(".indexSiteArea").children(".indexSiteList").children(".indexSiteListIn").click(function(e) {
			var win_W		 = $(window).width();			//螢幕寬度
			if ( win_W <= 768 ) {
				$(this).children("ul").slideToggle();
				//$(this).toggleClass("active");
				$(".indexSiteArea").children(".indexSiteList").children(".indexSiteListIn").not(this).children("ul").slideUp();
				//$(".fR_nav").not(this).removeClass("active");
			}
		});
	});
	
	$(window).resize(function(e) {
        var win_W		 = $(window).width();			//螢幕寬度
		if ( win_W >= 768 ) {
			$(".indexSiteArea ul").removeAttr("style");
		}
    });	
	
		
	

	
	
//----------------------------------遊戲紀錄資訊高度----------------------------------

	//遊戲紀錄資訊高度計算
	function recordTableAreaH() {

		var recordthH    = $("ul.recordArea .table_area thead").innerHeight();	//版頭高度
		var recordimgH   = $(".recordArea").children(".img_area").innerHeight();	//版頭高度
		var recordtbodyH = recordimgH-recordthH-6
		
		$("ul.recordArea .table_area tbody").css({
			// 'max-height': recordtbodyH
			'height': recordtbodyH
		});

		//console.log('-----------------'+index_bannerLeftH);
		//console.log(winHeight - hederHeight);

		// console.log('recordthH：'+ recordthH);
		// console.log('recordimgH：'+ recordimgH);
		// console.log('recordtbodyH:'+ recordtbodyH);
	}
	


	//畫面寬度變化時圖片要重置
	$(window).resize(function(e) {
	
		//recordTableAreaH();
		if ( $(window).width() >= 1280 ) {
			recordTableAreaH();
		}else {
			$("ul.recordArea .table_area tbody").css({
				//'max-height': 'unset !important' ,
				'height':  250 + 'px' 
			});
		}
	});		

	
	// //會等到整個視窗裡所有資源都已經全部跑後才會執行
	$(window).load(function(){	
		recordTableAreaH();
	});


	
	
//----------------------------------首頁網站地圖區錨點距離----------------------------------

	//輪播尺寸高度計算
	function indexSiteH() {

		var hederHeight  = $(".header").innerHeight();;	//版頭高度

		$("#indexSitetop , #talentId , #silhouetteId , #gameId , #gameInId , #nawId , #newsId , #careerId , #contactId , #technicalId , #implementId  , #activityId , #memberId , #learnId , #searchId").css({
			'transform': 'translateY(-'+hederHeight+'px)'
		});

		//console.log('-----------------'+index_bannerLeftH);
		//console.log(winHeight - hederHeight);
	}
		
	//畫面寬度變化時圖片要重置
	$(window).resize(function(e) {
	
		indexSiteH();
		// if ( $(window).width() >= 990 ) {
		// 	indexSiteH()
		// }else {
		// 	$("#indexSitetop").css({
		// 		'transform': 'translateY(0px)'
		// 	});
		// }
	});		

	
	// //會等到整個視窗裡所有資源都已經全部跑後才會執行
	$(window).load(function(){		
		indexSiteH();	
	});









	
//----------------------------------首頁banner最小高度----------------------------------

	//輪播尺寸高度計算
	// function indexbannerH() {
	// 	var index_bannerLeftH = $(".bannerLeft").innerHeight();
	// 	var winHeight    = $(window).height();          //螢幕高度
	// 	var hederHeight  = $(".header").innerHeight();;	//版頭高度

	// 	$(".bannerArea .pcBanner").css({
	// 		'min-height': index_bannerLeftH + 100 ,
	// 		'height': (winHeight - hederHeight)*0.95
	// 	});

	// 	//console.log('-----------------'+index_bannerLeftH);
	// 	//console.log(winHeight - hederHeight);
	// }
		
	// //畫面寬度變化時圖片要重置
	// $(window).resize(function(e) {
	
	// 	if ( $(window).width() >= 640 ) {
	// 		indexbannerH();
	// 	}else {
	// 		$(".bannerArea .pcBanner").css({
	// 			'min-height': 'unset'
	// 		});
	// 	}
	// });		

	
	// //會等到整個視窗裡所有資源都已經全部跑後才會執行
	// $(window).load(function(){		
	// 	indexbannerH();	
	// });





	


//----------------------------------首頁左側影片高度----------------------------------

	//輪播尺寸高度計算
	// function IndexmaingH() {
	// 	var index_mainBottomH = $(".index_Catalog").innerHeight();

	// 	$(".index_VideoBg .index_video_list").css({
	// 		'height': index_mainBottomH
	// 	});
	// 	//console.log('-----------------'+indexNewsVideoBgH);
	// }
		
			//畫面寬度變化時圖片要重置
			// $(window).resize(function(e) {
			
			// 	if ( $(window).width() >= 860 ) {
			// 		IndexmaingH();
			// 	}else {
			// 		$(".index_VideoBg .index_video_list").css({
			// 			'height': 300
			// 		});
			// 	}
			// });		

			
			//會等到整個視窗裡所有資源都已經全部跑後才會執行
			// $(window).load(function(){		
			// 	IndexmaingH();	
			// });







//------------------------ 使手機版LINE 另開手機預設瀏覽器 20181226 -------------------
	if (/Line/.test(navigator.userAgent)) {
		var str=location.href
		if(str.indexOf("?")>-1)location.href =  location.href + '&openExternalBrowser=1';
		else location.href =  location.href + '?openExternalBrowser=1';
	}
 



//----------------------------------測試時隱藏連結用----------------------------------
$(function(){
	//$(".nav a").attr("href" , "javascript:void(0)");

	//$(".nav:first > a").attr("href" , "javascript:void(0)");
	// $(".nav:nth-child(2) a").attr("href" , "javascript:void(0)");
	//$(".header_search_area input").attr("onclick" , "location='javascript:void(0)'");		

	// $(".indexDepartmentBg .btn_area input , .indexNewsletterBg .btn_area input").attr("onclick" , "location='javascript:void(0)'");	
	//$(".headerRightLink a").attr("href" , "javascript:void(0)");		
	//$(".indexNAList a , .indexActList a , .btnArea a").attr("href" , "javascript:void(0)");

	//$(".indexbannerImg map area").attr("href" , "javascript:void(0)");
	//$(".mobileBannerArea map area").attr("href" , "javascript:void(0)");

	//$(".indexSiteArea a").attr("href" , "javascript:void(0)");	
	//$(".fR_navbar a").attr("href" , "javascript:void(0)");		
	// $(".navOpen").hide();
});	


 

 
 

$(function(){
});