$(function(){

	/* 메인비주얼배너 */
    window.mySwipe = $('#mySwipe').Swipe({
		auto: 3000, // 배너가 3초 간격으로 이동
		continuous: true, // 반복설정
		callback: function(index){ // 함수를 실행한 다음에 할 함수 설정
			$('.touch_bullet .active')
				.attr('src',$('.touch_bullet .active').attr('src').replace('on.png','off.png'))
			.removeClass('active');
			//    img/visual_bullet_on.png,     img/visual_bullet_off.png
			$('.touch_bullet img').eq(index)
				.attr('src',$('.touch_bullet img').eq(index).attr('src').replace('off.png','on.png'))
				.addClass('active');
		}
	}).data('Swipe');
    
	/* 비주얼 이전, 다음 버튼 */
	$('.touch_left_btn a').on('click',function(){
		mySwipe.prev();
		return false
	});
	$('.touch_right_btn a').on('click',function(){
		mySwipe.next();
		return false
	});
  
	/* 롤링 버튼 배너 */
	$('#roll_banner_wrap dd').not(':first').hide();
	var onBtn = $('#roll_banner_wrap dt a:first');
	//var onImg = $('#roll_banner_wrap dt a:first > img');
	
	$('#roll_banner_wrap dt a').on('click',function(){
		$('#roll_banner_wrap dd:visible').hide();
		$('img',onBtn).attr('src',$('img',onBtn).attr('src').replace('over.png','out.png'));
		var num = $('#roll_banner_wrap dt a').index(this);
		$('#roll_banner_wrap dd').eq(num).show();
		$('img',this).attr('src',$('img',this).attr('src').replace('out.png','over.png'));
		onBtn = $(this); // click 한 this
		return false;
		});
		
		var btnNum = 0;
		function autoPlay(){
			btnNum++;
			if(btnNum>=4) btnNum=0;
			$('#roll_banner_wrap dt a').eq(btnNum).trigger('click');
			auto1 = setTimeout(autoPlay,3000);
		}
		var auto1 = setTimeout(autoPlay,3000);
		
		$('.playBtn').on('click',function(){
			clearTimeout(auto1);
			auto1 = setTimeout(autoPlay,3000);
			$('img',this).attr('src',$('img',this).attr('src').replace('off.gif','on.gif'));
			$('.stopBtn img').attr('src',$('.stopBtn img').attr('src').replace('on.gif','off.gif'));
			return false;
			
		});
		$('.stopBtn').on('click',function(){
			clearTimeout(auto1);
			$('img',this).attr('src',$('img',this).attr('src').replace('off.gif','on.gif'));
			$('.playBtn img').attr('src',$('.playBtn img').attr('src').replace('on.gif','off.gif'));
			return false;
		});
	/* 탭메뉴 */
	var onTab = $('#tabmenu dt a:first');
	$('#tabmenu dt a').on('mouseover focus click',function(){
		$('#tabmenu dd:visible').hide();
		$('img',onTab).attr('src',$('img',onTab).attr('src').replace('over.jpg','out.jpg'));
		$(this).parent().next().show();
		$('img',this).attr('src',$('img',this).attr('src').replace('out.jpg','over.jpg'));
		onTab = $(this);
		return false;
	});
	
	/* 신상품 계절 슬라이더 */
	var mySlider=$('#best_bg ul').bxSlider({
			mode:'horizontal', // 수평방향으로 이동
			speed:300, // 이동속도
			pager:false, // 페이징 표시를 제어(숨김 또는 노출)
			moveSlides:1, // 이동 슬라이드 갯수
			slideWidth:170, // 한 개 슬라이드 폭(width)
			minSlides:5, // 최소 노출 슬라이드 수
			maxSlides:5, // 최대 노출 슬라이드 수
			slideMargin:50, // 슬라이드 간의 간격
			auto:true, // 자동 슬라이드 여부
			autoHover:true, // 마우스 오버시 자동 정지
			controls:false // 이전 다음 버튼 숨김(아래 함수로 따로 코딩할 것임)
		});
		
		$('.prev_btn').on('click',function(){
			mySlider.goToPrevSlide();
			return false;
		});
		$('.next_btn').on('click',function(){
			mySlider.goToNextSlide();
			return false;
		});
	
	
	/* 팝업연동 */
	if($.cookie('pop')!='no') $('#pop_wrap').show();
	
	$('#pop_wrap').css('cursor','move').draggable();
	
	$('#pop_wrap area:eq(0)').on('click',function(){
		$('#pop_wrap').fadeOut('fast');
		return false;
	});
	$('#pop_wrap area:eq(1)').on('click',function(){
		$.cookie('pop','no',{expires:1});  //유효기간 하루동안을 저장
		$('#pop_wrap').fadeOut('fast');
		return false;
	});
	
	/* 이벤트슬라이드배너 */
	var visual = $('#brandVisual > ul > li');
	var button = $('#buttonList li');
	var current = 0;
	var setIntervalId;
	button.on({
		click:function(){
			var tg = $(this);
			var i = tg.index();
			if(current === tg.index()){return;}
			button.removeClass('on');
			tg.addClass('on');
			move(i);
			return false;
		}
	});
	
	timer();
	function timer(){
		setIntervalId = setInterval(function(){
			var n = current + 1;
			if(n==visual.size()) n=0;
			button.eq(n).trigger('click');
		},1500);
	}
	
	function move(i){
		var currentEl = visual.eq(current);
		var nextEl = visual.eq(i);
		currentEl.css({left:0}).stop().animate({left: '-100%'});
		nextEl.css({left:'100%'}).stop().animate({left:0});
		current = i;
		
	}
	
	$('#event_wrap').on({
		mouseover:function(){
			clearInterval(setIntervalId);
		},
		mouseout:function(){
			timer();
		}
	});
	
	/* 레시피 슬라이드 */
	function moveSlider(index){
		var willMoveLeft = -(index * 785);
		$('.slider_panel').animate({left:willMoveLeft},'slow');
		
		$('.control_button[data-index='+index+']').addClass('active');
		$('.control_button[data-index!='+index+']').removeClass('active');
		$('.slider_text[data-index='+index+']').show().animate({left:0},'slow');
		$('.slider_text[data-index!='+index+']').hide('slow',function(){
			$(this).css('left',-100)
		});
	} /* moveSlider(index) */
	
	$('.slider_text').css('left',-100).each(function(index){
		$(this).attr('data-index',index);
	});
	$('.control_button').each(function(index){
		$(this).attr('data-index',index);
	}).click(function(){
		var index = $(this).attr('data-index');
		moveSlider(index);
	});
	
	var randomNumber = Math.round(Math.random()*2);
	moveSlider(randomNumber);
	
	
});









