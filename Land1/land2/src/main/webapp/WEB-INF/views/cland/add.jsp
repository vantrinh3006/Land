<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
	<div class="clearfix content">
		<div class="contact_us">
			<h1>Đăng bài Bất động sản</h1>
			<div class="msg">
				<p style="color: green; font-size:20px">${msg }</p>
			</div>
			<div class="err">
				<p style="color: red; font-size:20px">${err }</p>
			</div>
			<form action="${pageContext.request.contextPath }/dang-tin" method="post" enctype="multipart/form-data" >
				<div class="form-group">
					<label for="lname">Tên đất</label><form:errors cssStyle="color:red; font-style:italic;" path="landErr.address"></form:errors><br/>
					<input type="text" name="lname" value="${itemLand.lname }" class="wpcf7-text" placeholder="Nhập tên đất">
				</div> <br/>
				<div class="form-group">
					<label>Danh mục </label> 
					<c:choose>
					<c:when test="${ not empty listCat }">
						<select class="form-control" name="cid" >
							<c:forEach items="${listCat }" var="itemCat">
								<option value="${itemCat.cid }" >${itemCat.cname }</option>
							</c:forEach>
						</select>
					</c:when>
					</c:choose>		
				</div>
				<div class="form-group">
					<label>Thêm hình ảnh</label>
					<input type="file" name="file" class="btn btn-default" id="exampleInputFile1">
					<form:errors cssStyle="color:red; font-style:italic;" path="landErr.picture"></form:errors>
					<p class="help-block"><em>Định dạng: jpg, png, jpeg,...</em></p>
				</div><br/>
				<div class="form-group">
					<label for="area">Diện tích</label><form:errors cssStyle="color:red; font-style:italic;" path="landErr.area"></form:errors><br/>
					<input type="number" name="area" value="0" step="5" class="wpcf7-number" placeholder="Nhập m2">
				</div><br/>
				<div class="form-group">
					<label for="address">Địa chỉ</label><form:errors cssStyle="color:red; font-style:italic;" path="landErr.address"></form:errors><br/>
					<input type="text" name="address" value="${itemLand.address }" class="wpcf7-text" placeholder="Nhập địa chỉ">
				</div><br/>
				<div class="form-group">
					<label for="description">Mô tả</label><form:errors cssStyle="color:red; font-style:italic;" path="landErr.description"></form:errors><br/>
					<textarea name="description" class="wpcf7-text" cols="50" rows="4" placeholder="Nhập mô tả BĐS" >${itemLand.description }</textarea>
				</div><br/>
				<div class="form-group">
					<label for="detail">Chi tiết</label><form:errors cssStyle="color:red; font-style:italic;" path="landErr.detail"></form:errors>
					<textarea name="detail" class="wpcf7-text" rows="4" placeholder="Nhập chi tiết BĐS" >${itemLand.detail }</textarea>
				</div>
					<script type="text/javascript">
						CKEDITOR.replace('detail');
					</script>
				<p>
					<input type="submit" name="submit" class="wpcf7-submit" value="Thêm tin" />
				</p>
			</form>
		</div>
	</div>
