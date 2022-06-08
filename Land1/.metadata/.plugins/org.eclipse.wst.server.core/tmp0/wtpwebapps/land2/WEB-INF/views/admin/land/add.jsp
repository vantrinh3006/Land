<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="row">
	<div class="col-md-12 panel-info">
		<div class="content-box-header panel-heading">
			<div class="panel-title ">Thêm bất động sản</div>
		</div>
		<div class="content-box-large box-with-header">
			<div>
				<div class="row mb-10"></div>
				<form action="${pageContext.request.contextPath }/admin/land/add" method="post" enctype="multipart/form-data" >
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label for="lname">Tên bất động sản</label> <form:errors cssStyle="color:red; font-style:italic;" path="landErr.lname"></form:errors>
								<input type="text" name="lname" value="${itemLand.lname }" class="form-control" placeholder="Nhập tên bất động sản">
							</div>
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
								<label>Thêm hình ảnh</label> <form:errors cssStyle="color:red; font-style:italic;" path="landErr.picture"></form:errors>
								<input type="file" name="file" class="btn btn-default" id="exampleInputFile1">
								<p class="help-block">
									<em>Định dạng: jpg, png, jpeg,...</em>
								</p>
							</div>
							<div class="form-group">
								<label for="area">Diện tích</label><form:errors cssStyle="color:red; font-style:italic;" path="landErr.area"></form:errors>
								<input type="number" name="area" value="0" step="5" class="form-control" placeholder="Nhập diện tích bằng số m2">
							</div>
							<div class="form-group">
								<label for="address">Địa chỉ</label><form:errors cssStyle="color:red; font-style:italic;" path="landErr.address"></form:errors>
								<input type="text" name="address" value="${itemLand.address }" class="form-control" placeholder="Nhập địa chỉ">
							</div>
							<div class="form-group">
								<label for="description">Mô tả</label><form:errors cssStyle="color:red; font-style:italic;" path="landErr.description"></form:errors>
								<textarea name="description" class="form-control" rows="4" placeholder="Nhập mô tả BĐS" >${itemLand.description }</textarea>
							</div>
							<div class="form-group">
								<label for="detail">Chi tiết</label><form:errors cssStyle="color:red; font-style:italic;" path="landErr.detail"></form:errors>
								<textarea name="detail" class="form-control" rows="4" placeholder="Nhập chi tiết BĐS" >${itemLand.detail }</textarea>
							</div>
							<script type="text/javascript">
								CKEDITOR.replace('detail');
							</script>
						</div>
						<div class="col-sm-6"></div>
					</div>
					<hr>
					<div class="row">
						<div class="col-sm-12">
							<input type="submit" value="Thêm" class="btn btn-success" />
							<input type="reset" value="Nhập lại" onclick="return reload()" class="btn btn-default" />
						</div>
					</div>
			</form>
			</div>
		</div>
	</div>
</div>
<!-- /.row col-size -->