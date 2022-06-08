<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="row">
	<div class="col-md-12 panel-warning">
		<div class="content-box-header panel-heading">
			<div class="panel-title ">Dashboard</div>
		</div>
		<div class="msg">
			<p style="color: green; font-size:20px">${msg }</p>
		</div>
		<div class="err">
			<p style="color: red; font-size:20px">${err }</p>
		</div>
		<div class="content-box-large box-with-header">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-4">
					<div class="panel panel-back noti-box">
						<span class="icon-box bg-color-green set-icon"> <span
							class="glyphicon glyphicon-th-list"></span>
						</span>
						<div class="text-box">
							<p class="main-text">
								<a class="fs-14" href="${pageContext.request.contextPath }/admin/cat/index" title="">Quản lý danh mục</a>
							</p>
							<p class="text-muted">Có ${countCat } danh mục</p>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-4 col-xs-4">
					<div class="panel panel-back noti-box">
						<span class="icon-box bg-color-blue set-icon"> <span
							class="glyphicon glyphicon-book"></span>
						</span>
						<div class="text-box">
							<p class="main-text">
								<a class="fs-14" href="${pageContext.request.contextPath }/admin/land/index" title="">Quản lý bất động sản</a>
							</p>
							<p class="text-muted">Có ${countLand } bất động sản</p>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-4 col-xs-4">
					<div class="panel panel-back noti-box">
						<span class="icon-box bg-color-brown set-icon"> <span
							class="glyphicon glyphicon-user"></span>
						</span>
						<div class="text-box">
							<p class="main-text">
								<a class="fs-14" href="${pageContext.request.contextPath }/admin/user/index" title="">Quản lý người dùng</a>
							</p>
							<p class="text-muted">Có ${countUser } người dùng</p>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-4 col-xs-4">
					<div class="panel panel-back noti-box">
						<span class="icon-box bg-color-blue set-icon"> <span
							class="glyphicon glyphicon-envelope"></span>
						</span>
						<div class="text-box">
							<p class="main-text">
								<a class="fs-14" href="${pageContext.request.contextPath }/admin/contact/index" title="">Quản lý liên hệ</a>
							</p>
							<p class="text-muted">Có ${countContact } liên hệ</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-6">
		<div class="content-box-large">
			<div class="panel-heading">
				<div class="panel-title">Chào mừng đến với trang quản trị</div>

				<div class="panel-options">
					<a href="#" data-rel="collapse"><i
						class="glyphicon glyphicon-refresh"></i></a> <a href="#"
						data-rel="reload"><i class="glyphicon glyphicon-cog"></i></a>
				</div>
			</div>
			<div class="panel-body">
				... <br />
				<br />
			</div>
		</div>
	</div>

	<div class="col-md-6">
		<div class="row">
			<div class="col-md-12">
				<div class="content-box-header">
					<div class="panel-title">Hướng dẫn sử dụng</div>

				</div>
				<div class="content-box-large box-with-header">

					... <br />
					<br />
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="content-box-header">
					<div class="panel-title">Nội quy</div>
				</div>
				<div class="content-box-large box-with-header">
					... <br />
					<br />
				</div>
			</div>
		</div>
	</div>
</div>