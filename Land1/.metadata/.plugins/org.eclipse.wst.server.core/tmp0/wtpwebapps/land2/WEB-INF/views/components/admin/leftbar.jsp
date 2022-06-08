<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="col-md-2">
		  	<div class="sidebar content-box" style="display: block;">
                <!-- Nav-bar -->
				<ul class="nav">
				    <!-- Main menu -->
				    <li class="current"><a href="${pageContext.request.contextPath }/admin/index"><i class="glyphicon glyphicon-home"></i> Trang chủ</a></li>
				    <li><a href="${pageContext.request.contextPath }/admin/cat/index"><i class="glyphicon glyphicon-list"></i> Danh mục</a></li>
				    <li><a href="${pageContext.request.contextPath }/admin/land/index"><i class="glyphicon glyphicon-book"></i> Bất động sản</a></li>
				    <li><a href="${pageContext.request.contextPath }/admin/user/index"><i class="glyphicon glyphicon-user"></i> Người dùng</a></li>
				    <li><a href="${pageContext.request.contextPath }/admin/contact/index"><i class="glyphicon glyphicon-envelope"></i> Liên hệ</a></li>
				    <li class="submenu">
				         <a href="${pageContext.request.contextPath }/auth/login">
				            <i class="glyphicon glyphicon-off"></i> Pages
				            <span class="caret pull-right"></span>
				         </a>
				         <!-- Sub menu -->
				         <ul>
				            <li><a href="${pageContext.request.contextPath }/auth/login?redirect=admin">Login</a></li>
				            <li><a href="${pageContext.request.contextPath }/auth/logout?redirect=admin">Logout</a></li>
				        </ul>
				    </li>
				</ul>
				<!-- /.nav-bar -->
             </div>
		  </div>