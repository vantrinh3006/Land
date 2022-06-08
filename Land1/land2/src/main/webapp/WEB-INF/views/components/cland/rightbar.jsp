<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="javaweb.utils.SlugUtil"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="clearfix sidebar_container floatright">
	<div class="clearfix sidebar">
		<div class="clearfix single_sidebar category_items">
			<h2>Danh mục bất động sản</h2>
			<ul>
				<c:choose>
					<c:when test="${ not empty listCat }">
						<c:forEach items="${listCat }" var="itemCat">
							<li class="cat-item"><a href="${pageContext.request.contextPath }/${SlugUtil.makeSlug(itemCat.cname)}-${itemCat.cid}">${itemCat.cname }</a>(${landService.countItemsByCid(itemCat.cid) })</li>
						</c:forEach>
					</c:when>
				</c:choose>	
			</ul>
		</div>
		
		<div class="clearfix single_sidebar">
			<div class="popular_post">
				<div class="sidebar_title">
					<h2>Mới nhất</h2>
				</div>
				<ul>
					<c:choose>
						<c:when test="${ not empty listLandNew }">
							<c:forEach items="${listLandNew }" var="itemLandNew">
								<li><a href="${pageContext.request.contextPath }/${SlugUtil.makeSlug(itemLandNew.lname)}-${itemLandNew.lid}.html">${itemLandNew.lname }</a></li>
							</c:forEach>
						</c:when>
					</c:choose>
				</ul>
			</div>
		</div>
		
		<div class="clearfix single_sidebar">
			<div class="popular_post">
				<div class="sidebar_title">
					<h2>Xem nhiều</h2>
				</div>
				<ul>
					<c:choose>
						<c:when test="${ not empty listLandCountView }">
							<c:forEach items="${listLandCountView }" var="itemLandCountView">
								<li><a href="${pageContext.request.contextPath }/${SlugUtil.makeSlug(itemLandCountView.lname)}-${itemLandCountView.lid}.html">${itemLandCountView.lname }</a></li>
							</c:forEach>
						</c:when>
					</c:choose>
				</ul>
			</div>
		</div>

		<div class="clearfix single_sidebar">
			<h2>Danh mục hot</h2>
			<ul>
				<c:choose>
					<c:when test="${ not empty listCatHot }">
						<c:forEach items="${listCatHot }" var="itemCatHot">
							<li><a href="${pageContext.request.contextPath }/${SlugUtil.makeSlug(itemCatHot.cname)}-${itemCatHot.cid}">${itemCatHot.cname } <span>(${landService.countItemsByCid(itemCatHot.cid) })</span></a></li>
						</c:forEach>
					</c:when>
				</c:choose>
				
			</ul>
		</div>
	</div>
</div>