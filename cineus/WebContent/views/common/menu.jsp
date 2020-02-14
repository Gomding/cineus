<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
    
    <%
		String id=(String)session.getAttribute("id");
	%>
<!-- 메뉴 -->
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
      <a class="navbar-brand" href="${context}/index.jsp">CINEUS TEST PAGE</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active" >
            <a class="nav-link" href="#">예매하기</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${context}/theater/getTheatersList.do">
           		영화관
            </a>
          </li>

          
          <c:if test="${id eq 'admin'}">
		  <li class="nav-item">
            <a class="nav-link" href="${context}/views/admin/admin.jsp" id="admin">관리자</a>
          </li>
		  </c:if>
          
                    
          <li class="nav-item">
          	<c:choose>
          		<c:when test="${empty id}">
					<a class="nav-link" href="${context}/views/customer/login.jsp">로그인</a>
				</c:when>
				<c:otherwise>
					<a class="nav-link" href="${context}/customer/logout.do">로그아웃</a>
				</c:otherwise>
			</c:choose>
          </li>
        </ul>
        <div class="mt-2 mt-md-0" style="color:#ddd">
          <c:if test="${not empty id}">
          		<a class="nav-link" href="${context}/customer/mypage.do" style="color:gold;">
          			${id}님 마이페이지
          		</a>
          </c:if>
        </div>
        <!-- <form class="form-inline mt-2 mt-md-0">
          <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form> -->
      </div>
    </nav>
<!-- 메뉴 끝 -->
	
<!-- buy, theaters, login, admin -->