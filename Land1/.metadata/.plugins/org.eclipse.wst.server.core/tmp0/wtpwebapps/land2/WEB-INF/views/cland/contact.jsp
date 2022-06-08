<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
	<div class="clearfix content">
		<div class="contact_us">
			<h1>Liên hệ với chúng tôi</h1>
			<div class="msg">
				<p style="color: green; font-size:20px">${msg }</p>
			</div>
			<div class="err">
				<p style="color: red; font-size:20px">${err }</p>
			</div>
			<p>
				Tập đoàn bất động sản Global<br /> Email: <a
					href="http://gmail.com" title="">trvtrinh@gmail.com</a>
			</p>
			<form action="${pageContext.request.contextPath }/lien-he" method="post" >
				<p>
					<input type="text" name="fullname" value="${contactErr.fullname }" class="wpcf7-text" placeholder="Họ tên *"  /> <form:errors cssStyle="color:red; font-style:italic;" path="contactErr.fullname"></form:errors>
				</p>
				<p>
					<input type="text" name="email" value="${contactErr.email }" class="wpcf7-email" placeholder="Email *" /> <form:errors cssStyle="color:red; font-style:italic;" path="contactErr.email"></form:errors>
				</p>
				<p>
					<input type="text" name="subject" value="${contactErr.subject }" class="wpcf7-text" placeholder="Chủ đề *" /> <form:errors cssStyle="color:red; font-style:italic;" path="contactErr.subject"></form:errors>
				</p>
				<p>
					<form:errors cssStyle="color:red; font-style:italic;" path="contactErr.content"></form:errors><br/>
					<textarea class="wpcf7-textarea" name="content" rows="4" placeholder="Nội dung *">${contactErr.content }</textarea>
					<script type="text/javascript">
						CKEDITOR.replace('content');
					</script>
				</p>
				<p>
					<input type="submit" name="submit" class="wpcf7-submit" value="Gửi liên hệ" />
				</p>
			</form>
		</div>
	</div>
