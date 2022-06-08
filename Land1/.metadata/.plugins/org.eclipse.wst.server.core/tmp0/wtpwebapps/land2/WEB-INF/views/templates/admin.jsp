<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- header -->
<!DOCTYPE html>
<html>
  <head>
  <c:url value="/resources/admin" var="contextPath" scope="application"></c:url>
    <title> <tiles:insertAttribute name="title"></tiles:insertAttribute> </title>
    <link rel="shortcut icon" type="image/ico" href="${contextPath }/images/icon-180x180.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="${contextPath }/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- styles -->
    <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
    <link href="${contextPath }/css/style1.css" rel="stylesheet">
    <c:url value="/resources/lib" var="contextPathLib" scope="application"></c:url>
    <script type="text/javascript" src="${contextPathLib }/ckeditor/ckeditor.js" ></script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
  	<tiles:insertAttribute name="header"></tiles:insertAttribute>
<!-- /.header -->
    <div class="page-content">
    	<div class="row">
    	<tiles:insertAttribute name="leftbar"></tiles:insertAttribute>	  
		  <div class="col-md-10">
		  <tiles:insertAttribute name="body"></tiles:insertAttribute>	  	
		  </div><!-- /.col-md-10 -->
		</div><!-- /.row -->
    </div><!-- /.page-content -->
    <!-- Footer -->
    <tiles:insertAttribute name="footer"></tiles:insertAttribute>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://code.jquery.com/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${contextPath }/bootstrap/js/bootstrap.min.js"></script>
    <script src="${contextPath }/js/custom.js"></script>
    <script>
        function reload(){
            location.reload();
        }
    </script>
  </body>
</html>
    <!-- /.footer -->