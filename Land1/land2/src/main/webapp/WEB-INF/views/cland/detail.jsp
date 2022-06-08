<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="javaweb.utils.SlugUtil"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
	<div class="clearfix content">
	<c:url value="/resources/upload" var="img"></c:url>
		<h1>${itemLand.lname }</h1>
		<div class="clearfix post-meta">
			<p>
				<span><i class="fa fa-clock-o"></i> Địa chỉ: ${itemLand.address }</span><br/>
				<span><i class="fa fa-folder"></i> Diện tích: ${itemLand.area }m2</span>
				<span><i class="fa fa-clock-o"></i> Lượt xem: ${itemLand.count_views }</span>
			</p>
		</div>

		<div class="vnecontent">
			<p style="font-style: italic;" >${itemLand.description }</p> <br/>
			<p><img width="300px" height="250px" src="${img }/${itemLand.picture }" alt="" /></p> <br/>
			<p>${itemLand.detail }</p>
		</div>
	</div>
	<div class="more_themes">
		<h2>
			Bất động sản liên quan <i class="fa fa-thumbs-o-up"></i>
		</h2>
		<div class="more_themes_container">
			<c:choose>
				<c:when test="${ not empty listByCid }">
					<c:forEach items="${listByCid }" var="itemByCid">
						<c:if test="${itemByCid.lid != itemLand.lid }" >
							<div class="single_more_themes floatleft">
								<img src="${img }/${itemByCid.picture }" alt="" />
								<a href="${pageContext.request.contextPath }/${SlugUtil.makeSlug(itemByCid.lname)}-${itemByCid.lid}.html"><h2>${itemByCid.lname }</h2></a>
							</div>
						</c:if>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div class="single_more_themes floatleft">
						<h5>Không có bất động sản liên quan</h5>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
