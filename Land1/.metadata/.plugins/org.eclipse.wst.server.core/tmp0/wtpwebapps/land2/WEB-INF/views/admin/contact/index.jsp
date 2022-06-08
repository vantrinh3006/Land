<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<div class="content-box-large">
	<div class="row">
		<div class="panel-heading">
			<div class="panel-title ">Quản lý liên hệ</div>
		</div>
	</div>
	<hr>
	<div class="row">
		<div class="col-md-8">
		</div>
		<div class="col-md-4">
			<form action="${pageContext.request.contextPath }/admin/contact/search" method="post" >
				<div class="input-group form">
					<input type="text" name="search" class="form-control" placeholder="Search...">
					<span class="input-group-btn">
						<button class="btn btn-primary" type="submit">Search</button>
					</span>
				</div>
			</form>
		</div>
	</div>
	<div class="msg">
		<p style="color: green; font-size:20px">${msg }</p>
	</div>
	<div class="err">
		<p style="color: red; font-size:20px">${err }</p>
	</div>
	<div class="row">
		<div class="panel-body">
			<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
				<thead>
					<tr>
						<th>ID</th>
						<th>Fullname</th>
						<th>Email</th>
						<th>Subject</th>
						<th>Content</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${ not empty listContact }">
							<c:forEach items="${listContact }" var="itemContact">
								<tr class="odd gradeX">
									<td>${itemContact.cid }</td>
									<td class="center">${itemContact.fullname }</td>
									<td class="center">${itemContact.email }</td>
									<td class="center">${itemContact.subject }</td>
									<td class="center">
										<c:choose>
										  <c:when test="${fn:length(itemContact.content) > 40}">
										  ${fn:substring(itemContact.content, 0, 40)}...
										  </c:when>
										  <c:otherwise>
										    	${itemContact.content }
										  </c:otherwise>
										</c:choose>
									</td>
									<td class="center text-center">
										<a href="${pageContext.request.contextPath }/admin/contact/del/${itemContact.cid}" title="" onclick="return confirm('Bạn chắc chắn muốn xóa')" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Xóa</a></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:when test="${ not empty listSearch }">
							<c:forEach items="${listSearch }" var="itemSearch">
								<tr class="odd gradeX">
									<td>${itemSearch.cid }</td>
									<td class="center">${itemSearch.fullname }</td>
									<td class="center">${itemSearch.email }</td>
									<td class="center">${itemSearch.subject }</td>
									<td class="center">
										<c:choose>
										  <c:when test="${fn:length(itemSearch.content) > 40}">
										  ${fn:substring(itemSearch.content, 0, 40)}...
										  </c:when>
										  <c:otherwise>
										    	${itemSearch.content }
										  </c:otherwise>
										</c:choose>
									</td>
									<td class="center text-center">
										<a href="${pageContext.request.contextPath }/admin/contact/del/${itemSearch.cid}" title="" onclick="return confirm('Bạn chắc chắn muốn xóa')" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Xóa</a></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr class="odd gradeX">
								<td colspan="5" class="center">Không có liên hệ nào</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>

			<!-- Pagination -->
			<nav class="text-center" aria-label="...">
				<ul class="pagination">
					<c:choose>
						<c:when test="${page == 1 }">
							<li class="disabled" ><a href="javascript:void(0)" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${pageContext.request.contextPath }/admin/contact/index?page=${page - 1}" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
						</c:otherwise>
					</c:choose>
					<c:forEach begin="1" end="${numberOfPages }" step="1" varStatus="loop" >
						<li <c:if test="${loop.count == page }" >class="active"</c:if>>
								<a href="${pageContext.request.contextPath }/admin/contact/index?page=${loop.count}">${loop.count }</a>
						</li>
					</c:forEach>
					<c:choose>
						<c:when test="${page >= numberOfPages }">
							<li class="disabled" ><a href="javascript:void(0)" aria-label="Next"><span aria-hidden="true">»</span></a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${pageContext.request.contextPath }/admin/contact/index?page=${page + 1}" aria-label="Next"><span aria-hidden="true">»</span></a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>
			<!-- /.pagination -->

		</div>
	</div>
	<!-- /.row -->
</div>
<!-- /.content-box-large -->