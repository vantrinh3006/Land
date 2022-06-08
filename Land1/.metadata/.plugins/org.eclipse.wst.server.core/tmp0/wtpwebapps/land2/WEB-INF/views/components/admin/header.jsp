<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="header">
	     <div class="container">
	        <div class="row">
	           <div class="col-md-5">
	              <!-- Logo -->
	              <div class="logo">
	                 <h1><a href="${pageContext.request.contextPath }/admin/index">Admin</a></h1>
	              </div>
	           </div>
	           <div class="col-md-5">
	              <div class="row">
	                <div class="col-lg-12"></div>
	              </div>
	           </div>
	           <div class="col-md-2">
	              <div class="navbar navbar-inverse" role="banner">
	                  <nav class="collapse navbar-collapse bs-navbar-collapse navbar-right" role="navigation">
	                    <ul class="nav navbar-nav">
	                      <li class="dropdown">
	                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Chào ${userLogin.username } <b class="caret"></b></a>
	                        <ul class="dropdown-menu animated fadeInUp">
	                        	<c:choose>
									<c:when test="${not empty userLogin }">
										<li><a href="${pageContext.request.contextPath }/auth/logout?redirect=admin">Logout</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="${pageContext.request.contextPath }/auth/login?redirect=admin">Login</a></li>
									</c:otherwise>
								</c:choose>
	                        </ul>
	                      </li>
	                    </ul>
	                  </nav>
	              </div>
	           </div>
	        </div>
	     </div>
	</div>