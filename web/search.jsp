<%-- 
    Document   : search
    Created on : Jun 30, 2024, 5:48:04 PM
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
        <link rel="stylesheet" href="assets/css/search.css"> 
    </head>
    <body>
       <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
       <form action="search" method="post">
<div class="container">
<div class="row">
  <!-- BEGIN SEARCH RESULT -->
  <div class="col-md-12">
    <div class="grid search">
      <div class="grid-body">
        <div class="row">
          <!-- BEGIN FILTERS -->
          
          <div class="col-md-3">
            <h2 class="grid-title"><i class="fa fa-filter"></i> Filters</h2>
            <hr>
            
            <!-- BEGIN FILTER BY CATEGORY -->
            <h4>Loại</h4>
            <div class="checkbox">
                <label><input type="checkbox" class="icheck" checked name="type" value="12345"> Tất cả</label>
              <br>
                <label><input type="checkbox" class="icheck" name="type" value="1"> Đồ ăn </label>
                 <br>
                  <label><input type="checkbox" class="icheck"    name="type" value="2"  > Đồ uống </label>
                   <br>
                    <label><input type="checkbox" class="icheck" name="type" value="3"> Đồ ăn nhanh</label>
                     <br>
                      <label><input type="checkbox" class="icheck" name="type" value="4"> Đồ ăn vặt</label>
                       <br>
                      <label><input type="checkbox" class="icheck" name="type" value="5"> Khác</label>
            </div>
         <h4>Trạng thái</h4>
            <div class="checkbox">
                <label><input type="checkbox" class="icheck" checked name="status" value="- Hot New Sale Hết hàng"> Tất cả</label>
              <br>
                <label><input type="checkbox" class="icheck" name="status" value="Hot"> Hot</label>
                 <br>
                  <label><input type="checkbox" class="icheck" name="status" value="New"> New </label>
                   <br>
                    <label><input type="checkbox" class="icheck" name="status" value="Sale"> Sale </label>
                     <br>
                      <label><input type="checkbox" class="icheck" name="status" value="Hết hàng"> Hết hàng </label>
            </div>
            <!-- END FILTER BY CATEGORY -->
            
            <div class="padding"></div>
            
            <!-- BEGIN FILTER BY DATE -->
                      <!-- END FILTER BY DATE -->
            
            <div class="padding"></div>
            
            <!-- BEGIN FILTER BY PRICE -->
            <h4>Theo giá</h4>
                <div class="">
                    <label><input type="checkbox" class="icheck" checked name="price" value="1234"> Tất cả</label>
              <br>
              <label><input type="checkbox" class="icheck" name="price" value="1" > <20000 VND </label>
                 <br>
                 <label><input type="checkbox" class="icheck" name="price" value="2" > 20000-50000 VND </label>
                   <br>
                   <label><input type="checkbox" class="icheck" name="price" value="3" > 50000-100000 VND </label>
                     <br>
                     <label><input type="checkbox" class="icheck"  name="price" value="4" > >100000 VND </label>
            </div>
          
            
            
            <!-- END FILTER BY PRICE -->
          </div>
          <!-- END FILTERS -->
          <!-- BEGIN RESULT -->
          <div class="col-md-9">
            <h2><i class="fa fa-file-o"></i> Result</h2>
            <hr>
            <!-- BEGIN SEARCH INPUT -->
            <div class="input-group">
              <input type="text" class="form-control" value="" name="search">
              <span class="input-group-btn">
                <button class="btn btn-primary" type="submit"><i class="fa fa-search"></i></button>
              </span>
            </div>
            </form>
            <!-- END SEARCH INPUT -->
     
            
            <div class="padding"></div>
            
            <div class="row">
              <!-- BEGIN ORDER RESULT -->
              <div class="col-sm-6">
                <div class="btn-group">
                  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                
                  </button>

                </div>
              </div>
              <!-- END ORDER RESULT -->
              
              <div class="col-md-6 text-right">
                <div class="btn-group">
                  <button type="button" class="btn btn-default active"><i class="fa fa-list"></i></button>
                  <button type="button" class="btn btn-default"><i class="fa fa-th"></i></button>
                </div>
              </div>
            </div>
            
            <!-- BEGIN TABLE RESULT -->
        <div class="table-responsive">
  <table class="table table-hover">
    <tbody>
      <c:forEach items="${sessionScope.slist}" var="s">
        <tr onclick="window.location.href='porder?fid=${s.id}'" style="cursor:pointer;">
          <td class="number text-center">${s.id}</td>
          <td>${s.name}</td>
          <td class="image"><img src="${s.img}" alt=""></td>
          <td class="price text-right">${s.price} VND</td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
</div>
            </div>
            <!-- END TABLE RESULT -->
            
            <!-- BEGIN PAGINATION -->
         
            <!-- END PAGINATION -->
          </div>
          <!-- END RESULT -->
        </div>
      </div>
    </div>
  </div>
  <!-- END SEARCH RESULT -->
</div>
</div>
        
        
    </body>
</html>
