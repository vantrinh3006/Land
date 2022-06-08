<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<div class="content-box-large">
<c:url value="/resources/upload" var="img"></c:url>
	<div class="row">
		<div class="panel-heading">
			<div class="panel-title ">Quản lý đất</div>
		</div>
	</div>
	<hr>
	<div class="row">
		<div class="col-md-8">
			<a href="${pageContext.request.contextPath }/admin/land/add" class="btn btn-success"><span
				class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;Thêm</a>

		</div>
		<div class="col-md-4">
			<form action="${pageContext.request.contextPath }/admin/land/search" method="post" >
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
			<table class="table table-striped table-bordered" id="example">
				<thead>
					<tr>
						<th>ID</th>
						<th>Tên</th>
						<th>Danh mục</th>
						<th>Lượt đọc</th>
						<th>Hình ảnh</th>
						<th>Địa chỉ</th>
						<th>Tài khoản người đăng</th>
						<th>Chức năng</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${ not empty listLands }">
							<c:forEach items="${listLands }" var="itemland">
								<tr class="odd gradeX">
									<td>${itemland.lid }</td>
									<td class="center">
										${itemland.lname }
									</td>
									<td class="center">
										<c:forEach items="${listCat }" var="itemCat">
											<c:if test="${itemCat.cid == itemland.cid }">
												${itemCat.cname }
											</c:if>
										</c:forEach>
									</td>
									<td class="center">${itemland.count_views }</td>
									<td class="center"><img width="200px" height="150px" src="${img}/${itemland.picture }"/></td>
									<td class="center">${itemland.address }</td>
									<td class="center">
										<c:forEach items="${listUser }" var="itemUser">
											<c:if test="${itemUser.uid == itemland.uid }">
												${itemUser.username }
											</c:if>
										</c:forEach>
									</td>
									<td class="center text-center">
										<a href="${pageContext.request.contextPath }/admin/land/edit/${itemland.lid}" title="" class="btn btn-primary"><span class="glyphicon glyphicon-cog "></span> Sửa </a>
										<a href="${pageContext.request.contextPath }/admin/land/del/${itemland.lid}" title="" onclick="return confirm('Bạn chắc chắn muốn xóa')" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Xóa</a></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:when test="${ not empty listSearch }">
							<c:forEach items="${listSearch }" var="itemSearch">
								<tr class="odd gradeX">
									<td>${itemSearch.lid }</td>
									<td class="center">
										${itemSearch.lname }
									</td>
									<td class="center">
										<c:forEach items="${listCat }" var="itemCat">
											<c:if test="${itemCat.cid == itemSearch.cid }">
												${itemCat.cname }
											</c:if>
										</c:forEach>
									</td>
									<td class="center">${itemSearch.count_views }</td>
									<td class="center"><img width="200px" height="150px" src="${img}/${itemSearch.picture }"/></td>
									<td class="center">${itemSearch.address }</td>
									<td class="center">
										<c:forEach items="${listUser }" var="itemUser">
											<c:if test="${itemUser.uid == itemSearch.uid }">
												${itemUser.username }
											</c:if>
										</c:forEach>
									</td>
									<td class="center text-center">
										<a href="${pageContext.request.contextPath }/admin/land/edit/${itemSearch.lid}" title="" class="btn btn-primary"><span class="glyphicon glyphicon-cog "></span> Sửa </a>
										<a href="${pageContext.request.contextPath }/admin/land/del/${itemSearch.lid}" title="" onclick="return confirm('Bạn chắc chắn muốn xóa')" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Xóa</a></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr class="odd gradeX">
								<td colspan="7" class="center">Không có bất động sản nào</td>
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
							<li><a href="${pageContext.request.contextPath }/admin/land/index?page=${page - 1}" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
						</c:otherwise>
					</c:choose>
					<c:forEach begin="1" end="${numberOfPages }" step="1" varStatus="loop" >
						<li <c:if test="${loop.count == page }" >class="active"</c:if>>
								<a href="${pageContext.request.contextPath }/admin/land/index?page=${loop.count}">${loop.count }</a>
						</li>
					</c:forEach>
					<c:choose>
						<c:when test="${page >= numberOfPages }">
							<li class="disabled" ><a href="javascript:void(0)" aria-label="Next"><span aria-hidden="true">»</span></a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${pageContext.request.contextPath }/admin/land/index?page=${page + 1}" aria-label="Next"><span aria-hidden="true">»</span></a></li>
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