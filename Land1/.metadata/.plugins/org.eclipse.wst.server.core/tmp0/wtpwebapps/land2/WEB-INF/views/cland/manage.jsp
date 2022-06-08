<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="javaweb.utils.SlugUtil"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:url value="/resources/upload" var="img"></c:url>
	<h1>Quản lý đất</h1>
	<div class="msg">
		<p style="color: green; font-size:20px">${msg }</p>
	</div>
	<div class="err">
		<p style="color: red; font-size:20px">${err }</p>
	</div>
	<c:choose>
		<c:when test="${not empty listLandByUser }">
			<c:forEach items="${listLandByUser }" var="itemLandByUser">
				<div class="clearfix content">
					<div class="vnecontent">
						<div class="clearfix single_work">
							<img class="img_top" src="${img }/${itemLandByUser.picture}" alt="" />
							<img class="img_bottom" src="${contextPath }/images/work_bg2.png" alt="" />
							<h2>${itemLandByUser.lname }</h2>
							<a href="${pageContext.request.contextPath }/${SlugUtil.makeSlug(itemLandByUser.lname)}-${itemLandByUser.lid}.html"><p class="caption">${itemLandByUser.description }</p></a>
						</div>
						<div class="clearfix post-meta">
							<p>
								<span><i class="fa fa-map-marker"></i> Địa chỉ: ${itemLandByUser.address }</span><br/>
								<span><i class="fa fa-folder"></i> Diện tích: ${itemLandByUser.area }m2</span><br/>
								<span><i class="fa fa-clock-o"></i> Lượt xem: ${itemLandByUser.count_views }</span><br/><br/>
								<a style="background-color: yellow;font-size:25px" href="${pageContext.request.contextPath }/edit-${SlugUtil.makeSlug(itemLandByUser.lname)}/${itemLandByUser.lid}">Sửa</a> -- <a style="background-color:red;font-size:25px" href="${pageContext.request.contextPath }/del/${itemLandByUser.lid}" onclick="return confirm('Bạn chắc chắn muốn xóa')">Xóa</a>
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<div class="clearfix content">
				<p>Không tìm thấy bài đăng nào</p>
			</div>
		</c:otherwise>
	</c:choose>
	
