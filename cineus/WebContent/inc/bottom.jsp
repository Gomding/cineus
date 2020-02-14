<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://code.jquery.com/jquery-Latest.js"></script>
<div style="background-color: #333;position:relative; bottom:0px;">   
<div class="footer" style="width:1100px">
	<div class="container">
       <div class="float-left" style="position: absolute;left:40px"> 
        <div class="row">
			<a href="" class="text-muted">회사소개</a>&nbsp;|&nbsp;
			<a href="" class="text-muted">채용정보</a>&nbsp;|&nbsp;
			<a href="" class="text-muted">제휴/광고 문의</a>&nbsp;|&nbsp;
			<a href="" class="text-muted">이용약관</a>&nbsp;|&nbsp;
			<a href="" class="text-muted">개인정보 처리방침</a>&nbsp;|&nbsp;
			<a href="${pageContext.request.contextPath}/customerboard/customcenter.do" class="text-muted">고객센터</a>&nbsp;|&nbsp;
			<a href="" class="text-muted">윤리경영</a>
		</div>
        <div class="row">
			부산광역시 부산진구 동천로 109 삼한골든게이트빌딩 7층<br>
			조장 한혜인  |  조원 박민영 진혜정 서길남 손유현<br>
			사업자등록번호 211-86-59478  |  통신판매업신고번호 제 833호
		</div>
	   </div>
		<div class="float-right" style="position: absolute;left:540px;top:22px">
	        <div class="row">
	          <div class="col-12 text-center">
	            <div class="social-icons float-right">
	              <a href="#" style="background: #3b5998;"><span class="icon-facebook"></span></a>
	              <a href="#" style="background: red;"><span class="icon-youtube"></span></a>
	              <a href="#" style="background: #A03A9E;"><span class="icon-instagram"></span></a>
	            </div>
	            
	            <!-- 카카오톡 공유하기 -->
	            <div class="float-right" style="margin-right: 6px; margin-top: 3px;">  
	              <a id="kakao-link-btn">
	              	<img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_small.png"/>
	              </a>
	              <script type="text/javascript">
	              	Kakao.init('1bd6935444f3088d5be31ee6a2852920'); // 사용할 앱의 JavaScript 키
	              	Kakao.Link.createDefaultButton({
	                    container: '#kakao-link-btn',  //카카오톡 공유하기 버튼 생성
	                    objectType: 'feed',
	                    content: {
	                      title: 'CINEUS', // 본문 제목
	                      description: '#CINEUS #영화 #공유 #밥 #팀프로젝트',  // 본문 바로 아래 들어가는 영역
	                      imageUrl: 'http://k.kakaocdn.net/dn/Ao8Y2/btqBNjWDjd6/pLfyiFyrNrcG5A6LXyplEk/kakaolink40_original.png', // 이미지
	                      imageWidth: 800,
	                      imageHeight: 400,
	                      link: {
	                        mobileWebUrl: 'http://192.168.2.19:8090/cineus/index.home', //모바일 카톡에서 사용하는 웹링크
	                        webUrl: 'http://192.168.2.19:8090/cineus/index.home' //PC카톡에서 사용하는 웹링크
	                      }
	                    },
	                    social: {
	                      likeCount: 777, //좋아요
	                      commentCount: 45, //댓글
	                      sharedCount: 845 //공유 횟수
	                    },
	                    buttons: [
	                      {
	                        title: 'CINEUS 접속', //버튼이름
	                        link: {
	                          mobileWebUrl: 'http://192.168.2.19:8090/cineus/index.home', //모바일 카톡에서 사용하는 웹링크
	                          webUrl: 'http://192.168.2.19:8090/cineus/index.home' //PC카톡에서 사용하는 웹링크
	                        }
	                      },
	                    ]
	                  });

	              </script>
	            </div>
	          </div>
	        </div>
	        <div class="row">
	          <div class="col-12">
	            <div class="copyright float-right">
	                <p>
	                    Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This Project is made with <i class="icon-heart text-danger"></i> by <a href="${pageContext.request.contextPath}/index.jsp" class="text-muted">CINEUS</a>
	                </p>
	                <a href="${context}/views/admin/admin.jsp">어드민 임시링크</a>
	            </div>
	          </div>
	        </div>
	    </div> 
	     
	  </div>
    </div>
</div>   

  </div>
  <!-- .site-wrap -->
  <!-- loader -->
  <div id="loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#ff5e15"/></svg></div>
  <script src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
  <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.stellar.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.countdown.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/bootstrap-datepicker.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
  <script src="${pageContext.request.contextPath}/js/aos.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.fancybox.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.sticky.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.mb.YTPlayer.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/main.js"></script>