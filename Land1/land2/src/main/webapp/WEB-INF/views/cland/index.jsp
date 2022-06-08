<%@page import="javaweb.utils.SlugUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<c:url value="/resources/upload" var="img"></c:url>
	<div class="clearfix slider">
		<ul class="pgwSlider">
			<c:choose>
				<c:when test="${ not empty listSlider }">
					<c:forEach items="${listSlider }" var="itemSlider">
						<li>
							<img width="200px" height="100px" src="${img }/${itemSlider.picture}" alt="${itemSlider.lname }"
								data-description="${itemSlider.address }" 
								data-large-src="${img }/${itemSlider.picture}" />
						</li>
					</c:forEach>
				</c:when>
			</c:choose>
		</ul>
	</div>
	<div class="clearfix content">
		<div class="msg">
			<p style="color: green; font-size:20px">${msg }</p>
		</div>
		<div class="err">
			<p style="color: red; font-size:20px">${err }</p>
		</div>
		<div class="content_title">
			<h2>Bài viết mới</h2>
		</div>
		<c:choose>
			<c:when test="${ not empty listLand }">
				<c:forEach items="${listLand }" var="itemLand">
					<div class="clearfix single_content">
						<div class="clearfix post_date floatleft">
							<div class="date">
								<h3><fmt:formatDate value="${itemLand.date_create}" pattern="dd"/></h3>
								<p><fmt:formatDate value="${itemLand.date_create}" pattern="MMM"/></p>
							</div>
						</div>
						<div class="clearfix post_detail">
							<h2>
								<a href="${pageContext.request.contextPath }/${SlugUtil.makeSlug(itemLand.lname)}-${itemLand.lid}.html">${itemLand.lname}</a>
								${pageContext.request.contextPath}
							</h2>
							<div class="clearfix post-meta">
								<p>
									<span><i class="fa fa-clock-o"></i> Địa chỉ: ${itemLand.address} </span>
									<span><i class="fa fa-folder"></i> Diện tích: ${itemLand.area}m2</span>
									<span><i class="fa fa-clock-o"></i> Lượt xem: ${itemLand.count_views} </span>
								</p>
							</div>
							<div class="clearfix post_excerpt">
								<img src="${img }/${itemLand.picture}" alt="" />
								<p>${itemLand.description}</p>
							</div>
							<a href="${pageContext.request.contextPath }/${SlugUtil.makeSlug(itemLand.lname)}-${itemLand.lid}.html">Đọc thêm</a>
						</div>
					</div>
				</c:forEach>
			</c:when>
			<c:when test="${ not empty listSearch }">
				<c:forEach items="${listSearch }" var="itemSearch">
					<div class="clearfix single_content">
						<div class="clearfix post_date floatleft">
							<div class="date">
								<h3><fmt:formatDate value="${itemSearch.date_create}" pattern="dd"/></h3>
								<p><fmt:formatDate value="${itemSearch.date_create}" pattern="MMM"/></p>
							</div>
						</div>
						<div class="clearfix post_detail">
							<h2>
								<a href="${pageContext.request.contextPath }/${SlugUtil.makeSlug(itemSearch.lname)}-${itemSearch.lid}.html">${itemSearch.lname}</a>
							</h2>
							<div class="clearfix post-meta">
								<p>
									<span><i class="fa fa-clock-o"></i> Địa chỉ: ${itemSearch.address} </span>
									<span><i class="fa fa-folder"></i> Diện tích: ${itemSearch.area}m2</span>
									<span><i class="fa fa-clock-o"></i> Lượt xem: ${itemSearch.count_views} </span>
								</p>
							</div>
							<div class="clearfix post_excerpt">
								<img src="${img }/${itemSearch.picture}" alt="" />
								<p>${itemSearch.description}</p>
							</div>
							<a href="${pageContext.request.contextPath }/${SlugUtil.makeSlug(itemSearch.lname)}-${itemSearch.lid}.html">Đọc thêm</a>
						</div>
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div class="clearfix single_content">
					<p>Không tìm thấy bất động sản nào</p>
				</div>
			</c:otherwise>
		</c:choose>
</div>
	<div class="pagination">
		<nav>
			<ul>
				<c:choose>
					<c:when test="${page == 1 }">
						<li class="disabled" ><a href="javascript:void(0)" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${pageContext.request.contextPath }/trang-chu?page=${page - 1}" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
					</c:otherwise>
					</c:choose>
					<c:forEach begin="1" end="${numberOfPages }" step="1" varStatus="loop" >
						<li <c:if test="${loop.count == page }" >class="active"</c:if>>
								<a href="${pageContext.request.contextPath }/trang-chu?page=${loop.count}">${loop.count }</a>
						</li>
					</c:forEach>
					<c:choose>
						<c:when test="${page >= numberOfPages }">
							<li class="disabled" ><a href="javascript:void(0)" aria-label="Next"><span aria-hidden="true">»</span></a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${pageContext.request.contextPath }/trang-chu?page=${page + 1}" aria-label="Next"><span aria-hidden="true">»</span></a></li>
						</c:otherwise>
					</c:choose>
			</ul>
		</nav>
	</div>

