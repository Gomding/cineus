<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<nav class="menu-navigation-icons">
    <a href="${context}/members/fa_1.me" class="menu-magenta" id="fa1"><i class="fa fa-user"></i><span>회원정보</span></a>
    <a href="${context}/members/fa_2_1.me" class="menu-blue" id="fa2"><i class="fa fa-trophy"></i><span>멤버십 확인</span></a>
    <a href="${context}/reservation/fa_3.me" class="menu-green" id="fa3"><i class="fa fa-ticket"></i><span>예매 확인 / 취소</span></a>
    <a href="${context}/stores/fa_4.me" class="menu-yellow" id="fa4"><i class="fa fa-shopping-cart"></i><span>스토어 구매내역</span></a>
    <a href="${context}/members/fa_5.me" class="menu-red" id="fa5"><i class="fa fa-video-camera"></i><span>나의 무비스토리</span></a>
    <a href="${context}/customerboard/my1on1.do?pageNum=1"  class="menu-pink" id="fa6"><i class="fa fa-envelope-o"></i><span>나의 문의 내역</span></a>
</nav>