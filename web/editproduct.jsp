<%-- 
    Document   : editproduct
    Created on : Jun 21, 2024, 10:03:32 PM
    Author     : quanpyke
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fun" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="/contentpage/navbar.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="assets/css/profile.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <c:set var="efood" value="${sessionScope.efood}"></c:set>
        
                
        <form action="fedit" method="post" enctype="multipart/form-data">
                <div class="container rounded bg-white mt-5">
                    <div class="row">
                        <div class="col-md-4 border-right">
                            <label for="img">Select Image:</label>
                            <input type="file" name="img" id="img">
                        <c:if test="${not empty efood}">
                            <img src="${efood.img}" alt="Current Image" style="max-width: 100%; height: auto;">
                            <input type="hidden" name="currentImg" value="${efood.img}">
                        </c:if>
                    </div> 
                    <div class="col-md-8">
                        <div class="p-3 py-5">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <div class="d-flex flex-row align-items-center back">
                                    <i class="fa fa-long-arrow-left mr-1 mb-1"></i>
                                    <a href="data">
                                        <h6>Back to home</h6>
                                    </a>
                                </div>
                                <h6 class="text-right">Thêm sản phẩm</h6>
                            </div>
                            <div class="row mt-2">
                                <div class="col-md-12">
                                    ID: <input type="text" class="form-control" placeholder="ID:" name="id" value="${efood.id}">
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-12">
                                    Tên sản phẩm: <input type="text" class="form-control" value="${efood.name}" placeholder="Tên sản phẩm:" name="name">
                                </div>
                            </div>   ><!-- comment -->
                            <div class="row mt-3">
                                <div class="col-md-12"> 
                                    Loại: 
                                
                                    <select class="form-control" name="type">
                                        <option value="Đồ ăn" <c:if test="${efood.type == 1}">selected</c:if>>Đồ ăn</option>
                                    <option value="Đồ uống" <c:if test="${efood.type == 2}">selected</c:if>>Đồ uống</option>
                                        <option value="Đồ ăn nhanh" <c:if test="${efood.type == 3}">selected</c:if>>Đồ ăn nhanh</option>
                                        <option value="Đồ ăn vặt" <c:if test="${efood.type == 4}">selected</c:if>>Đồ ăn vặt</option>
                                        <option value="Khác" <c:if test="${efood.type == 5}">selected</c:if>>Khác</option>
                                        </select>
                                        
                                     
                                    </div>
                                </div>
                                        
                                    
                                        
                                <div class="row mt-3">
                                    <div class="col-md-12">
                                        Giá tiền: <input type="text" class="form-control" placeholder="VND/1" name="price" value="${efood.price}">
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-12">
                                    Số lượng: <input type="text" class="form-control" placeholder="Số lượng:" name="quantity" value="${efood.quantity}">
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-12">
                                    Trạng thái: 
                                    <select class="form-control" name="status">
                                        <option value="-" <c:if test="${efood.status == '-'}">selected</c:if>>-</option>
                                        <option value="New"<c:if test="${efood.status == 'New'}">selected</c:if>>New</option>
                                        <option value="Hot"<c:if test="${efood.status == 'Hot'}">selected</c:if>>Hot</option>
                                        <option value="Sale"<c:if test="${efood.status == 'Sale'}">selected</c:if>>Sale</option>
                                        <option value="Hết hàng"<c:if test="${efood.status == 'Hết hàng'}">selected</c:if>>Hết hàng</option>
                                        </select>
                                    </div>
                                </div>
                                        <!-- comment -->
                                <div class="mt-5 text-right">
                                    <button class="btn btn-primary profile-button" type="submit">Edit Product</button>
                                </div>
                            <c:set value="${requestScope.error}" var="error" ></c:set>
                            <c:out value="${error}"></c:out>
                                        
                            </div>
                    </div>
                </div>
            </div>
           
        </form>
    </body>
</html>

