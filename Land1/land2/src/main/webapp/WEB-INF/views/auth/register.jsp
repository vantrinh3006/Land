<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-wrapper">
			        <div class="box">
			            <div class="content-wrap">
			            	<img width="100px" height="100px" class="img-circle" src="${contextPath }/images/icon-180x180.png">
			                <h6>Đăng ký</h6>
			                <div class="err">
								<p style="color: red; font-size:20px">${err }</p>
							</div>
			                <form action="${pageContext.request.contextPath }/auth/register" method="post" >
				                <div class="form-group">
				                	<label class="text-left pull-left" for="username">Tên đăng nhập</label><form:errors cssStyle="color:red; font-style:italic;" path="registerErr.username"></form:errors>
				               		<input class="form-control" name="username" value="${user.username }" type="text" placeholder="Username">
				                </div>
				                
				                <div class="form-group">
				                	<label class="text-left pull-left" for="password">Mật khẩu</label><form:errors cssStyle="color:red; font-style:italic;" path="registerErr.password"></form:errors>
				                	<input class="form-control" name="password" value="" type="password" placeholder="Password">
				                </div>
				                
				                <div class="form-group">
				                	<label class="text-left pull-left" for="repassword">Xác nhận mật khẩu</label><form:errors cssStyle="color:red; font-style:italic;" path="registerErr.repassword"></form:errors>
				                	<input class="form-control" name="repassword" value="" type="password" placeholder="RePassword">
				                </div>
				                
				                <div class="form-group">
				                	<label class="text-left pull-left" for="fullname">Họ và tên</label><form:errors cssStyle="color:red; font-style:italic;" path="registerErr.fullname"></form:errors>
				                	<input class="form-control" name="fullname" value="${user.fullname }" type="text" placeholder="FullName">
				                </div>
				                
				                <div class="action">
				                    <input class="btn btn-primary signup btn-block" type=submit name="submit" value="Đăng ký" />
				                </div>
			                </form>                
			            </div>
			        </div>
			    </div>
			</div>
		</div>