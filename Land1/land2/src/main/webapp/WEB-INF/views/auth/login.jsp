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
			                <h6>Đăng nhập</h6>
			                <div class="err">
								<p style="color: red; font-size:20px">${msg }</p>
							</div>
			                <div class="err">
								<p style="color: red; font-size:20px">${err }</p>
							</div>
			                <form action="${pageContext.request.contextPath }/auth/login" method="post" >
			                <div class="form-group">
			                	<label class="text-left pull-left" for="username">Tên đăng nhập</label><form:errors cssStyle="color:red; font-style:italic;" path="loginErr.username"></form:errors>
			               		<input class="form-control" name="username" value="${username }" type="text" placeholder="Username">
			                </div>
			                
			                <div class="form-group">
			                	<label class="text-left pull-left" for="password">Mật khẩu</label><form:errors cssStyle="color:red; font-style:italic;" path="loginErr.password"></form:errors>
			                	<input class="form-control" name="password" value="" type="password" placeholder="Password">
			                </div>
			                <input class="form-control" type="hidden" name="redirect" value="${redirect}" >
			                <div class="action">
			                    <input class="btn btn-primary signup btn-block" type=submit name="submit" value="Login" />
			                </div>   
			                </form>             
			            </div>
			        </div>

			        <div class="already">
			            <p>Don't have an account yet?</p>
			            <a href="${pageContext.request.contextPath }/auth/register">Sign Up</a>
			        </div>
			    </div>
			</div>
		</div>