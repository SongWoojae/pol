<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="google-translate-customization" content="6f1073ba568f1202-9c8990a4b3025b3e-ga74e3ea243d3f01d-14"></meta> <!-- 세계 언어 선택 메타 태그 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="Generator" content="Notepad++"/>
<meta name="Author" content="박애정"/>
<meta name="keywords" content="Cafe MeMeMi" />
<meta name="Description" content="Cafe MeMeMi 메인 페이지에 오신 것을 환영합니다"/>
<link rel="shortcut icon" href="resources/favicon/mememi_favi.png"> <!-- 파비콘 -->
<link rel="apple-touch-icon-precomposed" href="apple-icon.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="apple-icon-114x114.png">
<title>Cafe MeMeMi</title>
<link rel="stylesheet" type="text/css" href="resources/css/base.css" media="all" />
<link rel="stylesheet" type="text/css" href="resources/css/main.css" media="all" />
<script type="text/javascript" src="resources/js/jquery-1.10.2.min.js"></script> <!-- 제이쿼리 라이브러리 연동 -->

<script type="text/javascript" src="resources/js/jquery.easing.1.3.min.js"></script> 
<script type="text/javascript" src="resources/js/swipe.js"></script> <!-- 터치 슬라이드 플러그인 연동 -->
<script type="text/javascript" src="resources/js/jquery.bxslider.min.js"></script>  <!-- bxSlider 플러그인 연동 -->
<script type="text/javascript" src="resources/js/jquery-ui-1.10.4.custom.min.js"></script> <!-- UI 플러그인 연동 -->
<script type="text/javascript" src="resources/js/jquery.cookie.js"></script>  <!-- 쿠키 플러그인 연동 -->
<script type="text/javascript" src="resources/js/common.js"></script>
<script type="text/javascript" src="resources/js/main.js"></script>
<script src="resources/js/DB_springMove_fn.js"></script>	

<script src="https://maps.googleapis.com/maps/api/js"></script>
<script src="resources/js/map.js"></script>
<script src="resources/js/map2.js"></script>
<script src="resources/js/map3.js"></script>
<style>
	#map-canvas, #map-canvas2, #map-canvas3{width: 353px; height: 222.45px;  background-color: #ffffff; border: 1px solid #e0e0e0;}

</style>
</head>


<body>
<div class="header_content">
	<div class="hd_logo">
		<a href="#">
			<img src="resources/img/n_logo.png" alt="" />
		</a>
	</div>
</div>
<div id="wrap">
	<div id="top_event">
		<div class="event">
			<div class="close_btn"></div>
		</div>
	</div>
	<div id="header">
		<!-- <div class="head_info">
			<img src="resources/img/7_clock.png" class="fl" />
			<p class="txt fl">
				전국에 계시는 발 빠른 미식가
			</p>	
			<p class="txt2 fl">	
				<span>샛별배송</span>을 소개합니다!
			</p>
		</div> -->
		<!-- <h1><a href="#"><img src="resources/img/neon_logo.png" alt="미미미" /></a></h1> -->
		<dl id="util_menu">
			<dt class="hide">유틸메뉴</dt>
			<dd class="clickme fl DB_etc10_1" style="width: 128px;"><img src="resources/img/login_click3.png"/></dd>
			<dd class="util_first">
				<ul>
					<li class="login_wrap logtxt"><a href="#">LOGIN</a>
						<form action="#" method="post" name="log_f" id="login_f">
							<fieldset>
								<legend>로그인</legend>
								<p class="user_id">
									<label for="user_id">
										<img src="resources/img/login_title_id.gif" alt="아이디" />
									</label>
									<input type="text" name="user_id" id="user_id"/>
								</p>
								<p class="user_pw">
									<label for="user_pw">
										<img src="resources/img/login_title_pw.gif" alt="패드워드" />
									</label>
									<input type="password" name="user_pw" id="user_pw"/>
								</p>
								<p>
									<input type="checkbox" name="save_id" id="save_id"/>
									<label for="save_id">비밀번호 저장</label>
								</p>
								<p class="log_btn">
									<input type="image" src="resources/img/login_btn2.png" alt="로그인버튼" />
								</p>
								<p class="join_btn_wrap">
									<a href="#">회원가입</a>
									<a href="#" class="sch_id_btn">아이디/비밀번호찾기</a>
								</p>
								<p class="login_close_btn">
									<a href="#"><img src="resources/img/login_close_btn2.png" alt="닫기버튼" /></a>
								</p>
							</fieldset>
						</form>
					</li>
					<li class="logtxt"><a href="#">|&nbsp;&nbsp;&nbsp;JOIN</a></li>
					<!-- <li><a href="#">|&nbsp;&nbsp;&nbsp;고객센터</a></li> -->
				</ul>
			</dd>
			<dd>
				<ul id="zoom">
					<li><img src="resources/img/util_zoom_1.gif" alt="" /></li>
					<li><a href="#" class="zoom_in"><img src="resources/img/util_zoom_2.gif" alt="" /></a></li>
					<li><a href="#" class="zoom_return"><img src="resources/img/util_zoom_3.gif" alt="" /></a></li>
					<li><a href="#" class="zoom_out"><img src="resources/img/util_zoom_4.gif" alt="" /></a></li>
				</ul>
			</dd>
			<dd>
				<a href="#" class="print_btn"><img src="resources/img/util_print.gif" alt="" /></a>
			</dd>
			<dd>
<div id="google_translate_element"></div><script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'ko', layout: google.translate.TranslateElement.InlineLayout.SIMPLE}, 'google_translate_element');
}
</script><script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>		
			</dd>
		</dl><!-- id="util_menu" -->
		<!-- <form action="#" method="get" name="sch_f" id="sch_f">
			<fieldset>
				<legend>검색폼</legend>
				<p>
					<input type="text" name="keyword" id="keyword" title="검색어입력" />
					<input type="image" src="resources/img/search-button.png" alt="검색" class="sch_btn"/>
				</p>
			</fieldset>
		</form> -->
		<h2 class="hide">메인메뉴</h2>
		<div id="gnb_wrap">
			<ul id="gnb">
				<li class="fir"><a href="#">MeMeMi</a>
					<ul class="sub1">
						<li><a href="#">About</a></li>
						<li><a href="#">Location</a></li>
						<li><a href="#">Contact Us</a></li>
					</ul>
				</li>
				<li><a href="#">Caffè</a>
					<ul class="sub2">
						<li><a href="#">Season Menu</a></li>
						<li><a href="#">Espresso</a></li>
						<li><a href="#">Tea</a></li>
						<li><a href="#">Others</a></li>
						<li><a href="#">Fresh Juice</a></li>
						<li><a href="#">Dessert</a></li>
						<li><a href="#">Food</a></li>
					</ul>
				</li>
				<li><a href="#">Lifestyle</a>
					<ul class="sub3">
						<li><a href="#">Polspotten</a></li>
						<li><a href="#">Qeeboo</a></li>
					</ul>
				</li>
				<li><a href="#">Trend</a>
					<ul class="sub4">
						<li><a href="#">Food</a></li>
						<li><a href="#">Life Style</a></li>
						<li><a href="#">Culture</a></li>
					</ul>
				</li>
				<li><a href="#">Collective Shop</a>
					<ul class="sub5">
						<li><a href="#">All</a></li>
						<li><a href="#">Table</a></li>
						<li><a href="#">Chair</a></li>
						<li><a href="#">Stool</a></li>
						<li><a href="#">Objet</a></li>
						<li><a href="#">Lighting</a></li>
					</ul>
				</li>
				<li><a href="#">Event/Notice</a>
				</li>
				
			</ul><!-- id="gnb" -->
		</div> <!-- id="gnb_wrap"> -->
		<p id="total_btn">
			<a href="#"><img src="resources/img/btn_all_menu.png" alt="전체 메뉴" /></a>
		</p>
		<div id="total_menu">
			<dl>
				<dt>MeMeMi</dt>
				<dd>
					<ul>
						<li><a href="#">About</a></li>
						<li><a href="#">Location</a></li>
						<li><a href="#">Contact Us</a></li>
					</ul>
				</dd>
			</dl>
			<dl>
				<dd>
					<ul>
						<li><a href="#">Season Menu</a></li>
						<li><a href="#">Espresso</a></li>
						<li><a href="#">Tea</a></li>
						<li><a href="#">Others</a></li>
						<li><a href="#">Fresh Juice</a></li>
						<li><a href="#">Dessert</a></li>
						<li><a href="#">Food</a></li>
					</ul>
				</dd>
			</dl>
			<dl>
				<dd>
					<ul>
						<li><a href="#">Polspotten</a></li>
						<li><a href="#">Qeeboo</a></li>
					</ul>
				</dd>
			</dl>
			<dl>
				<dd>
					<ul>
						<li><a href="#">Food</a></li>
						<li><a href="#">Life Style</a></li>
						<li><a href="#">Culture</a></li>
					</ul>
				</dd>
			</dl>
			<dl>
				<dd>
					<ul>
						<li><a href="#">All</a></li>
					</ul>
				</dd>
			</dl>
			<dl>
				<dd>
				</dd>
			</dl>
			<p id="total_close"><a href="#"><img src="resources/img/allmenu_close_btn.png" alt="전체메뉴 닫기" /></a></p>
		</div><!-- id="total_menu" -->
		<!-- <p id="date_wrap">
			<span class="year">0000</span> 년
			<span class="month">00</span> 월
			<span class="date">00</span> 일
		</p> -->
	</div><!-- id="header" -->
	<hr />
	
	
	<div id="visual">
		<div id="mySwipe" class="swipe">
			<ul class="touch_banner swipe-wrap">
				<li class="mi01"><a href="#"></a></li>
				<li class="mi02"><a href="#"></a></li>
				<li class="mi03"><a href="#"></a></li>
			</ul>
		</div>
		<ul class="touch_bullet">
			<li><img src="resources/img/visual_bullet_on.png" class="active" alt="" /></li>
			<li><img src="resources/img/visual_bullet_off.png" alt="" /></li>
			<li><img src="resources/img/visual_bullet_off.png" alt="" /></li>
<!-- 			<li><img src="resources/img/visual_bullet_off.png" alt="" /></li>
			<li><img src="resources/img/visual_bullet_off.png" alt="" /></li>
			<li><img src="resources/img/visual_bullet_off.png" alt="" /></li>
			<li><img src="resources/img/visual_bullet_off.png" alt="" /></li> -->
		</ul>
		<p class="touch_left_btn">
			<a href="#"><img src="resources/img/slide-left-button.png" alt="이전 배너" /></a>
		</p>
		<p class="touch_right_btn">
			<a href="#"><img src="resources/img/slide-right-button.png" alt="다음 배너" /></a>
		</p>
	</div><!-- id="visual" -->
	<div id="fix_bn">
			<div class="fix_img"></div>
	</div>
	<hr />
	
	
	<div id="contents">
		<div id="main_goods">
			<h2>Best Menu</h2>
			<div class="uline"></div>
			<h4 class="subtitle">
				콜렉트 카페 미미미의 시그니처 드링크 & 푸드! <br />
				가장 많은 사랑을 받은 베스트셀링 메뉴는?
			</h4>
			<div class="a_wrap">
				<a href="#">
					<div class="goods_box">
					<div class="goods_img01">
						<img src="resources/img/main_goods_op_bg01.png" alt="" />
					</div>
					<!-- <div class="goods_info">
						<p class="strong">핑크 플로렌스(Pink Florence)</p>
						<p>장미향 가득한 아이스 큐브와 <br />
						상큼한 레몬 슬라이스로 입안 가득 <br />
						향기로움을 느껴보세요.</p>
					</div> -->
				</div>
				</a>
				<a href="#">
				<div class="goods_box">
					<div class="goods_img02">
						<img src="resources/img/main_goods_op_bg02.png" alt="" />
					</div>
					<!-- <div class="goods_info">
						<p class="strong">바닐라 스카이(Vanila Sky)</p>
						<p>구름같이 포근한 밀크폼과 코코넛의<br />
						부드러운 향이 어우러진 시원한<br />
						하늘을 닮은 커피!</p>
					</div> -->
				</div>
				</a>
				<a href="#">
				<div class="goods_box">
					<div class="goods_img03">
						<img src="resources/img/main_goods_op_bg03.png" alt="" />
					</div>
					<!-- <div class="goods_info">
						<p class="strong">마이코코(My Koko)</p>
						<p>입가에 미소가 번지게 하는<br />
						귀여운 코알라 모양의 마이 코코</p>
					</div> -->
				</div>
				</a>
				<a href="#">
				<div class="goods_box">
					<div class="goods_img04">
						<img src="resources/img/main_goods_op_bg04.png" alt="" />
					</div>
					<!-- <div class="goods_info">
						<p class="strong">와이 낫(Why Not)</p>
						<p>진한 카카오 브라우니 위에<br />
						생크림, 마쉬멜로우, 멜팅 초콜릿,<br />
						오레오 토핑이 가득!</p>
					</div> -->
				</div>
				</a>
			</div>
		</div><!--  id="main_goods"> -->
	
		<!-- <div id="contents_m">
			<ul>
				<li class="fl"><a href="#"><img src="resources/img/banner01.jpg"/></a></li>
				<li class="fl"><a href="#"><img src="resources/img/banner02.jpg"/></a></li>
				<li class="fl"><a href="#"><img src="resources/img/banner03.jpg"/></a></li>
				<li class="fl"><a href="#"><img src="resources/img/banner04.jpg"/></a></li>
			</ul>
		</div> -->
		<div id="recipe">
			<h3>Best Recipe</h3>
			<div class="uline"></div>
			<h4 class="subtitle">
				미미미를 100% 즐길 수 있는 가장 맛있는 조합!<br />
				그 마성의 레시피를 지금 바로 확인해보세요
			</h4>
			<div class="animation_canvas">
				<div class="slider_panel">
					<a href="#"><img src="resources/img/recipe8.png" alt="" class="slider_image" /></a>
					<a href="#"><img src="resources/img/recipe22.png" alt="" class="slider_image" /></a>
					<a href="#"><img src="resources/img/recipe7.png" alt="" class="slider_image" /></a>
					<!-- <a href="#"><img src="resources/img/recipe04.png" alt="" class="slider_image cl" /></a>
					<a href="#"><img src="resources/img/recipe05.png" alt="" class="slider_image" /></a> -->
				</div>
				
				<div class="control_panel">
					<div class="control_button"></div>
					<div class="control_button"></div>
					<div class="control_button"></div>
					<!-- <div class="control_button"></div>
					<div class="control_button"></div> -->
				</div>
			</div> <!-- animation_canvas -->
			<div class="slider_text_panel">
					<div class="slider_text st1">
						<!-- <h2>레시피상품</h2> -->
						<p class="line"></p>
						<a href="#"><img src="resources/img/76_a_320.jpg" alt="" /></a>
						<p>컵 티라미수(Cup Tiramisu)</p>
						<span>\6,500</span>
					</div>
					<div class="slider_text st2">
						<!-- <h2>레시피상품</h2> -->
						<p class="line"></p>
						<a href="#"><img src="resources/img/83_a_320.jpg" alt="" /></a>
						<p>리코타 치즈 샐러드(Ricota Cheese Salad)</p>
						<span>\9,700</span>
					</div>
					<div class="slider_text st3">
						<!-- <h2>레시피상품</h2> -->
						<p class="line"></p>
						<a href="#"><img src="resources/img/85_a_320.jpg" alt="" /></a>
						<p>트리플 멜로우(Triple Mellow)</p>
						<span>\7,000</span>
					</div>
					<!-- <div class="slider_text">
						
						<p class="line"></p>
						<a href="#"><img src="resources/img/r_goods04.png" alt="" /></a>
						<p>[선솔트] 머레이리버 고메 핑크솔트</p>
						<p>18,800원</p>
					</div>
					<div class="slider_text">
						
						<p class="line"></p>
						<a href="#"><img src="resources/img/r_goods05.png" alt="" /></a>
						<p>[소프트] 카망베르 치즈 2종</p>
						<p>14,900원</p>
					</div> -->
					
			</div><!-- class="slider_text_panel"> -->
		</div><!-- id="recipe" -->
		
		<div id="divide_line">
			<div class="dv_img"></div>
			<div class="bk_line"></div>
			<div class="dv_text">
				<p>Collect Cafe MeMeMi<br/>From Milano</p>
				<!-- <div class="uline_w"></div> -->
				<span>
					카페 미미미는 이탈리아 밀라노 비아 브레라 23에서 탄생한 글로벌 콜렉트 카페입니다. <br />
					미미미는 카페라는 틀에서 벗어나 패션과 라이프스타일을 접목한 새로운 공간을 선보이고 있습니다.
				</span>
			</div>
		</div>
				<div id="bestbook_zone">
			<h3>Collective Lifestyle Shop</h3>
			<div class="uline"></div>
			<h4 class="subtitle">
				카페를 넘어 문화와 라이프스타일이 공존하는 콜렉트 카페 MeMeMi! <br />
				미미미가 제안하는 감각적인 아이템들을 만나보세요.
			</h4>
			<div id="best_bg">
				<ul>
					<li><a href="#"><img src="resources/img/main_slider01.png" alt="" />
						<span>ZIG ZAG EMERALD GREEN</span>
						<p>\ 379,000</p>
					</a></li>
					<li><a href="#"><img src="resources/img/main_slider02.png" alt="" />
						<span>ZIG ZAG LIGHT BLUE</span>
						<p>\ 379,000</p>
					</a></li>
					<li><a href="#"><img src="resources/img/main_slider03.png" alt="" />
						<span>TAM TAM LIGHT BLUE</span>
						<p>\ 379,000</p>
					</a></li>
					<li><a href="#"><img src="resources/img/main_slider04.png" alt="" />
						<span>ZIG ZAG LIGHT PINK</span>
						<p>\ 379,000</p>
					</a></li>
					<li><a href="#"><img src="resources/img/main_slider05.png" alt="" />
						<span>BANANA BUNCH MULTI(2Colors)</span>
						<p>\ 89,000</p>
					</a></li>
					<li><a href="#"><img src="resources/img/main_slider06.png" alt="" />
						<span>RABBIT CHAIR</span>
						<p>\ 279,000</p>
					</a></li>
					<li><a href="#"><img src="resources/img/main_slider07.png" alt="" />
						<span>CHAIR HOLY VELVET YELLOW</span>
						<p>\ 519,000</p>
					</a></li>
					<li><a href="#"><img src="resources/img/main_slider08.png" alt="" />
						<span>STOOL PAPERCLIP RATTAN</span>
						<p>\ 219,000</p>
					</a></li>
					<li><a href="#"><img src="resources/img/main_slider09.png" alt="" />
						<span>ZIG ZAG YELLOW</span>
						<p>\ 379,000</p>
					</a></li>
					<li><a href="#"><img src="resources/img/main_slider10.png" alt="" />
						<span>ZIG ZAG BLUE</span>
						<p>\ 379,000</p>
					</a></li>
					

				</ul>
				<p class="prev_btn"><a href="#"><img src="resources/img/slide-sub-left-button-black.png" alt="이전으로 이동" /></a></p>
				<p class="next_btn"><a href="#"><img src="resources/img/slide-sub-right-button-black.png" alt="다음으로 이동" /></a></p>
			</div><!-- id="best_bg" -->
		</div><!-- id="bestbook_zone" -->
		
			<div id="contents_top">
			<div id="roll_banner_wrap">
				<h3>&nbsp;</h3>
				<dl>
					<dt class="roll_btn1"><a href="#" class="active"><img src="resources/img/pop_btn_1_over.png" alt="버튼1" /></a></dt>
					<dd><a href="#"><img src="resources/img/40_2.jpg" alt="배너1" /></a></dd>
					<dt class="roll_btn2"><a href="#"><img src="resources/img/pop_btn_2_out.png" alt="버튼2" /></a></dt>
					<dd><a href="#"><img src="resources/img/21_2.jpg" alt="배너2" /></a></dd>
					<dt class="roll_btn3"><a href="#"><img src="resources/img/pop_btn_3_out.png" alt="버튼3" /></a></dt>
					<dd><a href="#"><img src="resources/img/life_pole01_2.jpg" alt="배너3" /></a></dd>
					<dt class="roll_btn4"><a href="#"><img src="resources/img/pop_btn_4_out.png" alt="버튼4" /></a></dt>
					<dd><a href="#"><img src="resources/img/shop_main_02_2.jpg" alt="배너4" /></a></dd>
					<!-- <dt class="roll_btn5"><a href="#"><img src="resources/img/pop_btn_5_out.png" alt="버튼5" /></a></dt>
					<dd><a href="#"><img src="resources/img/new_goods05.jpg" alt="배너5" /></a></dd>
					<dt class="roll_btn6"><a href="#"><img src="resources/img/pop_btn_6_out.png" alt="버튼6" /></a></dt>
					<dd><a href="#"><img src="resources/img/new_goods06.jpg" alt="배너6" /></a></dd>
					<dt class="roll_btn7"><a href="#"><img src="resources/img/pop_btn_7_out.png" alt="버튼7" /></a></dt>
					<dd><a href="#"><img src="resources/img/new_goods07.jpg" alt="배너7" /></a></dd> -->
				</dl>
				<p class="ctl_btn">
					<a href="#" class="playBtn"><img src="resources/img/pop_btn_play_on.gif" alt="재생 버튼" /></a>
					<a href="#" class="stopBtn"><img src="resources/img/pop_btn_stop_off.gif" alt="정지 버튼" /></a>
				</p>
			</div><!-- id="roll_banner_wrap" -->

			<!-- <dl id="tabmenu">
				<dt class="tab_btn1"><a href="#"><img src="resources/img/tab_btn_2_over.jpg" alt="무료배송" /></a></dt>
				<dd>
					<img src="resources/img/banner01.jpg" alt="Kulry lovers" class="fl" />
					<p class="tab_more"><a href="#"><img src="resources/img/tab_more_btn.png" alt="더보기" /></a></p>
				</dd>
				<dt class="tab_btn2"><a href="#"><img src="resources/img/tab_btn_1_out.jpg" alt="회원혜택" /></a></dt>
				<dd>
					<img src="resources/img/banner02.jpg" alt="Kulry lovers" class="fl" />
					<p class="tab_more"><a href="#"><img src="resources/img/tab_more_btn.png" alt="더보기" /></a></p>
				</dd>
				<dt class="tab_btn3"><a href="#"><img src="resources/img/tab_btn_3_out.jpg" alt="가격조정안" /></a></dt>
				<dd>
					<img src="resources/img/banner03.jpg" alt="Kulry lovers" class="fl" />
					<p class="tab_more"><a href="#"><img src="resources/img/tab_more_btn.png" alt="더보기" /></a></p>
				</dd>
			</dl> --><!-- id="tabmenu" --><!-- 탭 메뉴를 이용해 최근 게시물 리스트 만들기 -->
			<!-- <div id="event_wrap" class="fl">
				
				<div id="brandVisual">
					<ul>
						<li class="visual_0"><a href="#">배너이미지1</a></li>
						<li class="visual_1"><a href="#">배너이미지2</a></li>
						<li class="visual_2"><a href="#">배너이미지3</a></li>
						<li class="visual_3"><a href="#">배너이미지3</a></li>
						<li class="visual_4"><a href="#">배너이미지3</a></li>
						<li class="visual_5"><a href="#">배너이미지3</a></li>
					</ul>
				</div>
				<ul id="buttonList">
					<li class="on"><a href="#">배너1</a></li>
					<li><a href="#">배너2</a></li>
					<li><a href="#">배너3</a></li>
					<li><a href="#">배너4</a></li>
					<li><a href="#">배너5</a></li>
					<li><a href="#">배너6</a></li>
				</ul>
			</div> -->
		</div><!-- id="contents_top" -->
		
		
		<!-- 자동 슬라이드 배너를 이용한 베스트 BOOK 영역 만들기 -->

		
		<div id="contents_bottom" class="cf">
			<div id="map">
				<h3>MeMeMi Store</h3>
				<div class="uline"></div>
			<h4 class="subtitle">
				눈과 입이 즐거운 콜렉트 카페 MeMeMi! <br />
				아름다운 인테리어와 향긋한 커피향이 여러분을 기다립니다.
			</h4>
				<div class="map_area ma1">
					<img src="resources/img/store_new02.png" width="352" alt="" />
					<div id="map_wrap">
						<div id="map-canvas" width="354" height="500" title="찾아오시는 길"></div>
					</div>
					<strong>현대시티몰 가든파이브점</strong>
					<span>서울 송파구 충민로 66 (문정동) <br />
					현대시티몰 가든파이브</span>
				</div>
				<div class="map_area ma2">
					<img src="resources/img/store_new03.png" width="352" alt="" />
					<div id="map_wrap2">
						<div id="map-canvas2" width="354" height="500" title="찾아오시는 길"></div>
					</div>
					<strong>잠실 롯데월드몰점</strong>
					<span>서울 송파구 올림픽로 300 (신천동) <br />
					롯데월드몰</span>
				</div>
				<div class="map_area ma3">
					<img src="resources/img/store_new04.png" width="352" alt="" />
					<div id="map_wrap3">
						<div id="map-canvas3" width="354" height="500" title="찾아오시는 길"></div>
					</div>
					<strong>이탈리아 밀라노점</strong>
					<span>VIA BRERA 23 20121 MILANO <br />
					ITALY</span>
				</div>
			</div><!-- id="map_wrap" -->	
		</div><!-- id="contents_bottom" -->	
			<!-- <div id="sns_wrap">
				<h3>Store Search</h3>			
				<iframe src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2Fcafemememi%2F&tabs=timeline&width=500&height=400&small_header=false&adapt_container_width=true&hide_cover=false&show_facepile=false&appId" width="500" height="400" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true">
				</iframe>
			</div> -->
			
		
			
			
			
			
			
			
			
			
		
			<!-- <div id="online_wrap">
				<h3>Kurly Loves</h3>
				<p>| Partners</p>
				<ul>
					<li class="fl"><a href="#"><img src="resources/img/online_banner01.png" alt="배너1" title="커피리브레" /></a></li>
					<li class="fl"><a href="#"><img src="resources/img/online_banner02.png" alt="배너2" title="비스테카" /></a></li>
					
					<li class="fl"><a href="#"><img src="resources/img/online_banner03.png" alt="배너3" title="오뗄두스"/></a></li>
					<li class="clear"><a href="#"><img src="resources/img/online_banner05.png" alt="배너4"title="콜린스그린" /></a></li>
					
					<li class="fl"><a href="#"><img src="resources/img/online_banner04.png" alt="배너5" title="르까도드마비"/></a></li>
					<li class="fl"><a href="#"><img src="resources/img/online_banner06.png" alt="배너6"title="본앤브레드" /></a></li>
				</ul>
			</div><!-- id="online_wrap" -->
		
		<div id="quick_menu">
			<h3>
				<a href="#">Delivery !
					<img src="data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTYuMC4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgdmVyc2lvbj0iMS4xIiBpZD0iQ2FwYV8xIiB4PSIwcHgiIHk9IjBweCIgd2lkdGg9IjEyOHB4IiBoZWlnaHQ9IjEyOHB4IiB2aWV3Qm94PSIwIDAgNzkuNTM2IDc5LjUzNiIgc3R5bGU9ImVuYWJsZS1iYWNrZ3JvdW5kOm5ldyAwIDAgNzkuNTM2IDc5LjUzNjsiIHhtbDpzcGFjZT0icHJlc2VydmUiPgo8Zz4KCTxnPgoJCTxwYXRoIGQ9Ik0wLDUwLjc3NmgxNS42MTVjLTEuMDM4LDEuMzg4LTEuNjY1LDMuMDg2LTEuNjY1LDQuOTYxSDYuMjU4TDAsNTQuMTUyVjUwLjc3NnogTTc5LjUzNiw0MS45MzMgICAgdjEzLjgwNWgtNi42MjhjMC0wLjE5Ny0wLjAyNi0wLjM4My0wLjA0Mi0wLjU4Yy0wLjA3Mi0xLjEyOS0wLjM4My0yLjIwNi0wLjg3NS0zLjE4Yy0xLjM3Mi0yLjY4Mi00LjE1Mi00LjUxNi03LjM2OC00LjUxNiAgICBjLTQuNTc3LDAtOC4yOSwzLjcwOC04LjI5LDguMjc1SDMwLjUxNWMwLTEuODc1LTAuNjI0LTMuNTczLTEuNjctNC45NjFoMjQuNjg3di0yOC43M2gxMy44NDd2My4zMTNsNC40MTcsMTMuMjU2TDc5LjUzNiw0MS45MzN6ICAgICBNNjguNDgsMzguNjE2bC0zLjMwNC05Ljk0MmgtNy43MzV2OS45NDJINjguNDh6IE0yOC4zMDQsNTUuNzM3YzAsMy4zNTUtMi43MTgsNi4wNzktNi4wNjYsNi4wNzkgICAgYy0zLjM2MSwwLTYuMDc3LTIuNzM0LTYuMDc3LTYuMDc5YzAtMy4zNCwyLjcyMS02LjA2OCw2LjA3Ny02LjA2OEMyNS41ODUsNDkuNjY5LDI4LjMwNCw1Mi4zOTIsMjguMzA0LDU1LjczN3ogTTI1LjU0Niw1NS43MzcgICAgYzAtMS44MjItMS40ODktMy4zMTQtMy4zMDktMy4zMTRjLTEuODM4LDAtMy4zMywxLjQ5Mi0zLjMzLDMuMzE0YzAsMS44NDQsMS40OTEsMy4zMTMsMy4zMywzLjMxMyAgICBDMjQuMDU4LDU5LjA1MSwyNS41NDYsNTcuNTgxLDI1LjU0Niw1NS43Mzd6IE03MC42OTcsNTUuNzM3YzAsMy4zNTUtMi43MjksNi4wNzktNi4wNzQsNi4wNzljLTMuMzc2LDAtNi4wNzktMi43MzQtNi4wNzktNi4wNzkgICAgYzAtMy4zNCwyLjcyNC02LjA2OCw2LjA3OS02LjA2OEM2Ny45NjgsNDkuNjY5LDcwLjY5Nyw1Mi4zOTIsNzAuNjk3LDU1LjczN3ogTTY3LjkzOCw1NS43MzdjMC0xLjgyMi0xLjQ4Ni0zLjMxNC0zLjMxNC0zLjMxNCAgICBjLTEuODQ5LDAtMy4zMTMsMS40OTItMy4zMTMsMy4zMTRjMCwxLjg0NCwxLjQ2NSwzLjMxMywzLjMxMywzLjMxM0M2Ni40NTEsNTkuMDUxLDY3LjkzOCw1Ny41ODEsNjcuOTM4LDU1LjczN3ogTTUwLjY4NCwxNy43MkgwICAgIHYzMS4xNTFoNTAuNjg0VjE3LjcyeiIgZmlsbD0iI2UwNDk2MyIvPgoJPC9nPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+Cjwvc3ZnPgo=" /></a>
			</h3>
			<ul>
				<li><a href="#">NEW ARRIVAL</a></li>
				<li><a href="#">WISH LIST</a></a></li>
				<li><a href="#">CART(0)</a></li>
				<li><a href="#">COUPON</a></li>
				<li><a href="#">EVENT</a></li>
				<li class="last">
					<a href="#top" class="fl qucik_btn"><img src="resources/img/quick_up.png" alt="위로" /></a>
					<a href="#footer_wrap"class="fl qucik_btn"><img src="resources/img/quick_down.png" alt="아래로" /></a>
				</li>
			</ul>
		</div><!-- id="quick_menu" -->
		<p id="pop_wrap">
			<img src="resources/img/pop_event_new.png" alt="컬리를 가장 쉽고 편하게 이용하는 방법!" usemap="#pop" />
			<map name="pop" id="pop">
				<area shape="rect" coords="189,522,320,549" href="#" alt="창닫기" />
				<area shape="rect" coords="350,522,400,549" href="#" alt="하루동안 창 닫기" />
			</map>
		</p>
	</div><!-- id="contents" -->
<hr />

<div id="footer_wrap">
<div class="footer_cover"></div>

	<!-- <div id="happy_call" class="cf">
		<div class="wrap01 fl">
			<p>고객행복센터</p> <br />
			<p>1644-1107</p>
		</div>
		<div class="wrap02 fl">
				<p>AM 9:00 ~PM 04:00 / <strong>Lunch</strong> PM 12:00 ~ PM 01:00 / <strong>SATURDAY</strong> AM 09:00 ~ PM 12:00 /</p> <br />
				<p>고객센터가 종료된 오후 4시 이후와 일요일, 공휴일에는 1:1 문의하기 게시판을 이용해주세요.</p>
		</div>
	</div> --> <!-- id="happy_call"> -->

	<div id="inner_footer">
		<h3 class="footer_logo">
			<a href="#"><img src="resources/img/neon_logo.png" alt="footer logo" /></a>
		</h3>
		<dl id="bottom_menu">
			<dt class="hide">하단메뉴</dt>
			<dd><a href="#">회사소개</a></dd>
			<dd><a href="#">매장소개</a></dd>
			<dd><a href="#">Contact Us</a></dd>
			<dd><a href="#">개인정보취급방침</a></dd>
			<dd><a href="#">이용약관</a></dd>
			<dd><a href="#">고객센터</a></dd>
		</dl>
		<div id="relSite_wrap">
			<h3>MeMeMi&nbsp; Partners</h3>
			<form action="#" method="get" name='rel_f'>
				<fieldset>
					<legend>관련 사이트 이동</legend>
					<select name="rel_select">
						<option value="#">----선택----</option>
						<option value="http://coffeelibre.kr/">커피 리브레</option>
						<option value="http://www.johncookdelimeats.com/">델리미트</option>
						<option value="http://www.bistecca.co.kr/">비스테카</option>
						<option value="http://www.bistecca.co.kr/">콜린스그린</option>
						<option value="http://www.bistecca.co.kr/">오뗄두스</option>
						<option value="http://www.bistecca.co.kr/">본앤브레드</option>
					</select>
					<input type="image" src="resources/img/rel_site_btn.gif" alt="관련 사이트 이동" />
				</fieldset>
			</form>
		</div><!-- id="relSite_wrap" -->
		<address>
			<div class="ellipsis">(주)미미미 대표이사:양지해&nbsp;&nbsp; / &nbsp;&nbsp;Add : 서울 강남구 도산대로 318 SB타워 9층&nbsp; / &nbsp;Tel : 02-410-0080</div> <!-- <br /> -->
			<div class="ellipsis">E-mail : jhlee1@metrocity.co.kr&nbsp; / &nbsp;사업자등록번호 : 519-87-00640&nbsp; / &nbsp;통신판매업신고 : 2017-서울강남-0327</div><!-- <br /> -->
			<div class="ellipsis">개인정보관리책임자 : 임진빈</div> <!-- <br /> -->
		</address>
	</div><!-- id="inner_footer" -->
</div><!-- id="footer_wrap" -->
</div><!-- id="wrap" -->
	
<script> 
	$('.DB_etc10_1').DB_springMove({
		key:'e24102',                //라이센스키
		dir:'x',               //방향축('x','y')
		mirror:1,              //반대방향이동(1,-1)
		radius:10,             //반경
		motionSpeed:0.1       //속도(0~1)
	})

</script>






	
</body>
</html>









