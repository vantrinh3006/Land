<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
<c:url value="/resources/cland" var="contextPath" scope="application"></c:url>
<title><tiles:insertAttribute name="title"></tiles:insertAttribute></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="shortcut icon" type="image/ico" href="${contextPath }/images/icon-180x180.png" />
	<!--Oswald Font -->
	<link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css' />
	<link rel="stylesheet" type="text/css" href="${contextPath }/css/tooltipster.css" />
		<!-- home slider-->
	<link href="${contextPath }/css/pgwslider.css" rel="stylesheet" />
			<!-- Font Awesome -->
	<link rel="stylesheet" href="${contextPath }/css/font-awesome.min.css" />
	<link href="${contextPath }/style.css" rel="stylesheet" media="screen" />
	<link href="${contextPath }/responsive.css" rel="stylesheet" media="screen" />
	<c:url value="/resources/lib" var="contextPathLib" scope="application"></c:url>
    <script type="text/javascript" src="${contextPathLib }/ckeditor/ckeditor.js" ></script>
</head>

<body>
	<tiles:insertAttribute name="header"></tiles:insertAttribute>
	<section id="content_area">
	<div class="clearfix wrapper main_content_area">
		<div class="clearfix main_content floatleft">
			<tiles:insertAttribute name="body"></tiles:insertAttribute>
		</div>
			<tiles:insertAttribute name="rightbar"></tiles:insertAttribute>
		
	</div>
	</div>
	</section>
	<tiles:insertAttribute name="footer"></tiles:insertAttribute>

	<script type="text/javascript"
		src="http://code.jquery.com/jquery-1.7.0.min.js"></script>
	<script type="text/javascript" src="${contextPath }/js/jquery.tooltipster.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('.tooltip').tooltipster();
		});
	</script>
	<script type="text/javascript" src="${contextPath }/js/selectnav.min.js"></script>
	<script type="text/javascript">
		selectnav('nav', {
			label : '-Navigation-',
			nested : true,
			indent : '-'
		});
	</script>
	<script src="${contextPath }/js/pgwslider.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('.pgwSlider').pgwSlider({

				intervalDuration : 5000

			});
		});
	</script>
	<script type="text/javascript" src="${contextPath }/js/placeholder_support_IE.js"></script>
</body>
</html>
