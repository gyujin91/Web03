<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />  
<%
	String sid = "";
	if(session !=null) sid = (String) session.getAttribute("sid");  
%>
<header id="header" class="panel-heading">
	<div class="hd_wrap">
		<nav class="navbar" role="navigation" aria-label="main navigation">
		  <div class="navbar-brand">
		    <a class="navbar-item" href="${path }/index.jsp" id="logo">
		      <img src="${path }/img/img_header_logo.png" width="220" height="39">
		    </a>
		
		    <a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
		      <span aria-hidden="true"></span>
		      <span aria-hidden="true"></span>
		      <span aria-hidden="true"></span>
		    </a>
		  </div>
		
		  <div id="gnb" class="navbar-menu">
		    <div class="navbar-start">
		      <div class="navbar-item has-dropdown is-hoverable">
		        <a class="navbar-link">
		          제품소개
		        </a>
		
		        <div class="navbar-dropdown">
		          <a class="navbar-item">
		            밀링
		          </a>
		          <a class="navbar-item">
		            드릴링
		          </a>
		          <a class="navbar-item">
		            쓰레딩
		          </a>
		          <a class="navbar-item">
		            터닝
		          </a>
		        </div>
		      </div>
		      <div class="navbar-item has-dropdown is-hoverable">
		        <a class="navbar-link">
		          고객지원
		        </a>
		        <div class="navbar-dropdown">
		          <a href="" class="navbar-item">
		            카탈로그
		          </a>
		          <a href="" class="navbar-item">
		            제품찾기
		          </a>
		          <a href="" class="navbar-item">
		            온라인주문
		          </a>	       
		          <a href="" class="navbar-item">
		            Q&A
		          </a>
		          <a href="" class="navbar-item">
		            자료실
		          </a>		          
		        </div>
		      </div>
		      <div class="navbar-item has-dropdown is-hoverable">
		        <a class="navbar-link">
		          회사소개
		        </a>
		
		        <div class="navbar-dropdown">
		          <a class="navbar-item" href="">
		            YG-1 소개
		          </a>
		          <a class="navbar-item">
		            비전&미션
		          </a>
		          <a class="navbar-item">
		            연혁
		          </a>
		          <a class="navbar-item">
		            CEO
		          </a>
		          <a class="navbar-item">
		            사업장소개
		          </a>
		          <a class="navbar-item">
		            홍보자료
		          </a>
		          <a class="navbar-item">
		            재무정보
		          </a>
		          <a class="navbar-item">
		            공지사항
		          </a>
		        </div>
		      </div>
		      <div class="navbar-item has-dropdown is-hoverable">
		        <a class="navbar-link">
		          인재채용
		        </a>
		
		        <div class="navbar-dropdown">
		          <a class="navbar-item" href="">
		            채용안내
		          </a>
		          <a class="navbar-item">
		            채용공고
		          </a>
		          <a class="navbar-item">
		            입사지원
		          </a>
		          <a class="navbar-item">
		            합격조회
		          </a>
		          <a class="navbar-item">
		            채용문의
		          </a>
		        </div>
		      </div>
		      <div class="navbar-item has-dropdown is-hoverable">
		        <a class="navbar-link">
		          고객센터
		        </a>		
		        <div class="navbar-dropdown">
		          <a class="navbar-item" href="${path }/GetBoardListCtrl">
		            공지사항
		          </a>
			      <c:if test="${!empty sid }">
			          <a href="${path }/mailForm.jsp" class="navbar-item">
			            1:1 문의
			          </a>
			      </c:if>    
		          <a class="navbar-item">
		            자주하는 질문 및 답변
		          </a>
		          <hr class="navbar-divider">
		          <a class="navbar-item">
		            반품안내
		          </a>
		        </div>
		      </div>
		    </div>
			<c:if test="${empty sid }">		
		    <div class="navbar-end">
		      <div class="navbar-item">
		        <div class="buttons">
		          <a href="${path }/member/agree.jsp" class="button is-primary">
		            <strong>회원가입</strong>
		          </a>
		          <a href="${path }/member/login.jsp" class="button is-light">
		            로그인
		          </a>
		        </div>
		      </div>
		      </c:if>
		      <c:if test="${!empty sid }">
		      <!-- 로그인 사용자 -->
		      <div class="navbar-item">
		        <div class="buttons">
		          <a href="${path }/myPageCtrl?userid=${sid }" class="button is-primary">
		            <strong>회원정보수정</strong>
		          </a>
		          <a href="" class="button is-light">
		            마이페이지
		          </a>
		          <a href="${path }/logOutCtrl" class="button is-light">
		            로그아웃
		          </a>
		        </div>
		      </div>
		      </c:if>
		      <!-- 관리자 -->
		      <c:if test="${sid=='admin' }">
		      <div class="navbar-item">
		        <div class="buttons">
		          <a href="${path }/GetBoardListCtrl" class="button is-primary">
		            <strong>글 관리</strong>
		          </a>
		          <a href="${path }/GetMemberListCtrl" class="button is-light">
		            회원관리
		          </a>
<%-- 		          <a href="${path }/adminMemberList.jsp" class="button is-light">
		            회원관리2
		          </a> --%>
		          <a href="${path }/GetGoodsListCtrl" class="button is-light">
		            제품관리
		          </a>
		          <a href="${path }/AccessListCtrl" class="button is-light">
		            접속자관리
		          </a>
		          <a class="button is-light">
		            판매관리
		          </a>
		        </div>
		      </div>
		      </c:if>
		    </div>
		  </div>
		</nav>
	</div>
</header>