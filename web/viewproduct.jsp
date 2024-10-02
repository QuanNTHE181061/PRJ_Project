<%-- 
    Document   : viewproduct
    Created on : Jun 21, 2024, 9:59:22 PM
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
    </head>
    <body>
      <section class="py-5">
    
    <div class="container px-4 px-lg-5 mt-5">
           <h5 class="fw-bolder" style="color:red">ĐANG HOT</h5>
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
        <c:forEach  items="${sessionScope.data}" var="s">
          
            <div class="col mb-5">
                <div class="card h-100">
                    <!-- Product image-->
                    <img class="card-img-top" src="${s.img}" alt="..." />
                    <!-- Product details-->
                    <div class="card-body p-4">
                        <div class="text-center">
                            <!-- Product name-->
                            <h5 class="fw-bolder">${s.name}</h5>
                            <!-- Product price-->
                             ${s.price} VND
                        </div>
                    </div>
                    <!-- Product actions-->
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
<div class="text-center">
  <a class="btn mt-auto" href="porder?fid=${s.id}" style="color: white; background-color: green; border-color: green;">Mua hàng 📝️</a>
</div>                        <c:if test="${acc.type!=2}">
                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="fedit?fid=${s.id}">Sửa 📝️</a></div>
                  <div class="text-center">
  <a class="btn btn-outline-dark mt-auto" href="pdelete?fid=${s.id}" onclick="return confirm('Bạn có muốn xoá sản phẩm này?')">Xoá 🗑️️</a>
                  </div >    
                   </c:if>
                    </div>

                </div>
            </div>
          
       </c:forEach >
    </div>
</section>
        
        
    </body>
</html>
