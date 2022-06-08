<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="content-box-large">
	<div class="row">
		<div class="panel-heading">
			<div class="panel-title ">Quản lý danh mục
			</div>
		</div>
	</div>
	<hr>
	<div class="row">
		<div class="col-md-8">
			<a href="${pageContext.request.contextPath }/admin/cat/add" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;Thêm</a>
		</div>
		<div class="col-md-4">
			<form action="${pageContext.request.contextPath }/admin/cat/search" method="post" >
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
						<th>Name</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${ not empty listCat }">
							<c:forEach items="${listCat }" var="itemCat">
								<tr class="odd gradeX">
									<td>${itemCat.cid }</td>
									<td class="center">${itemCat.cname }</td>
									<td class="center text-center">
										<a href="${pageContext.request.contextPath }/admin/cat/edit/${itemCat.cid}" title="" class="btn btn-primary"><span class="glyphicon glyphicon-cog "></span> Sửa </a>
										<a href="${pageContext.request.contextPath }/admin/cat/del/${itemCat.cid}" title="" onclick="return confirm('Thực hiện chức năng xóa sẽ xóa hết nhưng tin Bất động sản liên quan. Bạn chắc chắn muốn xóa?')" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Xóa</a></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:when test="${ not empty listSearch }">
							<c:forEach items="${listSearch }" var="itemSearch">
								<tr class="odd gradeX">
									<td>${itemSearch.cid }</td>
									<td class="center">${itemSearch.cname }</td>
									<td class="center text-center">
										<a href="${pageContext.request.contextPath }/admin/cat/edit/${itemSearch.cid}" title="" class="btn btn-primary"><span class="glyphicon glyphicon-cog "></span> Sửa </a>
										<a href="${pageContext.request.contextPath }/admin/cat/del/${itemSearch.cid}" title="" onclick="return confirm('Bạn chắc chắn xóa')" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Xóa</a></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr class="odd gradeX">
								<td colspan="3" class="center">Không có danh mục nào</td>
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
							<li><a href="${pageContext.request.contextPath }/admin/cat/index?page=${page - 1}" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
						</c:otherwise>
					</c:choose>
					<c:forEach begin="1" end="${numberOfPages }" step="1" varStatus="loop" >
						<li <c:if test="${loop.count == page }" >class="active"</c:if>>
								<a href="${pageContext.request.contextPath }/admin/cat/index?page=${loop.count}">${loop.count }</a>
						</li>
					</c:forEach>
					<c:choose>
						<c:when test="${page >= numberOfPages }">
							<li class="disabled" ><a href="javascript:void(0)" aria-label="Next"><span aria-hidden="true">»</span></a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${pageContext.request.contextPath }/admin/cat/index?page=${page + 1}" aria-label="Next"><span aria-hidden="true">»</span></a></li>
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