<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="javaweb.utils.SlugUtil" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
	<div class="clearfix content">
	<c:url value="/resources/upload" var="img"></c:url>
		<div class="content_title">
			<c:forEach items="${listCat }" var="itemCat">
				<c:if test="${itemCat.cid == cid }">
					<h2>${itemCat.cname }</h2>
				</c:if>
			</c:forEach>
		</div>
		<div class="clearfix single_work_container">
		<c:choose>
			<c:when test="${ not empty listLandByCid }">
				<c:forEach items="${listLandByCid }" var="itemLandByCid">
					<div class="clearfix single_work">
						<img class="img_top" src="${img }/${itemLandByCid.picture}" alt="" />
						<img class="img_bottom" src="${contextPath }/images/work_bg2.png" alt="" />
						<h2>${itemLandByCid.lname }</h2>
						<a href="${pageContext.request.contextPath }/${SlugUtil.makeSlug(itemLandByCid.lname)}-${itemLandByCid.lid}.html"><p class="caption">${itemLandByCid.description }</p></a>
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<h2> --- Chưa có bất động sản --- </h2>
			</c:otherwise>
		</c:choose>
		</div>
	</div>
