<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="row">
	<div class="col-md-12 panel-info">
		<div class="content-box-header panel-heading">
			<div class="panel-title ">Thêm người dùng</div>
		</div>
		<div class="content-box-large box-with-header">
			<div>
				<div class="row mb-10"></div>
				<form action="${pageContext.request.contextPath }/admin/user/add" method="post" >
					<div class="row">
						<div class="col-sm-6">
						<div class="err">
							<p style="color: red; font-size:20px">${err }</p>
						</div>
							<div class="form-group">
								<label for="name">Tên tài khoản</label> <form:errors cssStyle="color:red; font-style:italic;" path="userErr.username"></form:errors>
								<input type="text" name="username" value="${user.username }" class="form-control" placeholder="Nhập tên đăng nhập"><br/>
								<label for="name">Mật khẩu</label> <form:errors cssStyle="color:red; font-style:italic;" path="userErr.password"></form:errors>
								<input type="password" name="password" value="${user.password }" class="form-control" placeholder="Nhập password"><br/>
								<label for="name">Họ và tên:</label> <form:errors cssStyle="color:red; font-style:italic;" path="userErr.fullname"></form:errors>
								<input type="text" name="fullname" value="${user.fullname }" class="form-control" placeholder="Nhập họ và tên"><br/>
								<label>Phân quyền</label> 
								<c:choose>
									<c:when test="${ not empty listRole }">
									<select class="form-control" name="rid" >
										<c:forEach items="${listRole }" var="itemRole">
											<option value="${itemRole.rid }" >${itemRole.rname }</option>
										</c:forEach>
									</select>
									</c:when>
								</c:choose>	
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