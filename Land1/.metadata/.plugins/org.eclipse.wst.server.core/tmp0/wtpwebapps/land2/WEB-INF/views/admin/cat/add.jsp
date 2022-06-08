<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="row">
	<div class="col-md-12 panel-info">
		<div class="content-box-header panel-heading">
			<div class="panel-title ">Thêm danh mục</div>
		</div>
		<div class="content-box-large box-with-header">
		<div class="msg">
			<p style="color: green; font-size:20px">${msg }</p>
		</div>
		<div class="err">
			<p style="color: red; font-size:20px">${err }</p>
		</div>
			<div>
				<div class="row mb-10"></div>
				<form action="${pageContext.request.contextPath }/admin/cat/add" method="post" >
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label for="name">Tên danh mục</label> <form:errors cssStyle="color:red; font-style:italic;" path="catErr.cname"></form:errors>
								<input type="text" name="cname" value="${cname }" class="form-control" placeholder="Nhập tên danh mục">
							</div>
						</div>
					<div class="row">
						<div class="col-sm-12">
							<input type="submit" name="submit" value="Thêm" class="btn btn-success" /> 
							<input type="reset" value="Nhập lại" onclick="return reload()" class="btn btn-default" />
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
</div>
<!-- /.row col-size -->