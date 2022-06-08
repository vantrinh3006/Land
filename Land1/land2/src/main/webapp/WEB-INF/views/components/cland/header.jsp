<%@page import="javaweb.utils.SlugUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<section id="header_area">
			<div class="wrapper header">
				<div class="clearfix header_top">
					<div class="clearfix logo floatleft">
						<a href="${pageContext.request.contextPath }/trang-chu"><h1><span></span>Land</h1></a>
					</div>
					<div class="clearfix search floatright">
						<form action="${pageContext.request.contextPath }/search" method="post" >
							<input type="text" name="search" placeholder="Search"/>
							<input type="submit" />
						</form>
					</div>
				</div>
				<div class="header_bottom">
					<nav>
						<ul id="nav">
							<li><a href="${pageContext.request.contextPath }/trang-chu">Trang chủ</a></li>
							<li id="dropdown"><a href="javascrip:void(0)">Bất động sản</a>
							<ul>
								<c:choose>
									<c:when test="${ not empty listCat }">
										<c:forEach items="${listCat }" var="itemCat">
											<li><a href="${pageContext.request.contextPath }/${SlugUtil.makeSlug(itemCat.cname)}-${itemCat.cid}">${itemCat.cname }</a></li>
										</c:forEach>
									</c:when>
								</c:choose>		
							</ul>
							</li>
							<li><a href="https://www.facebook.com/profile.php?id=100004573397537">Giới thiệu</a></li>
							<li><a href="${pageContext.request.contextPath }/dang-tin">Đăng tin</a></li>
							<li><a href="${pageContext.request.contextPath }/lien-he">Liên hệ</a></li>
							<li style="float:right" id="dropdown">
								<a href="javascrip:void(0)">
									<c:choose>
										<c:when test="${not empty userLogin }">
											<i class="fa fa-user"></i> ${userLogin.username }  
										</c:when>
										<c:otherwise>
											Đăng nhập
										</c:otherwise>
									</c:choose>
								</a>
								<ul>
									<c:choose>
										<c:when test="${not empty userLogin }">
											<li><a href="${pageContext.request.contextPath }/${userLogin.username}/${userLogin.uid}" >Quản lý đất</a></li>
											<li><a href="${pageContext.request.contextPath }/auth/logout">Logout</a></li>
										</c:when>
										<c:otherwise>
											<li><a href="${pageContext.request.contextPath }/auth/login">Login</a></li>
										</c:otherwise>
									</c:choose>
								</ul>
							</li>
						</ul>
					</nav>
				</div>
			</div>
		</section>