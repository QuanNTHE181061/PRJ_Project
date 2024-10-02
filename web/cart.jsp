<%-- 
    Document   : cart
    Created on : Jun 26, 2024, 8:37:01 PM
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
       <section class="h-100">
  <div class="container h-100 py-5">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-10">

        <div class="d-flex justify-content-between align-items-center mb-4">
          <h3 class="fw-normal mb-0">Giỏ hàng</h3>
        
        </div>

          <c:set var="bl" value="${sessionScope.blist}"></c:set>
              
          
          <c:forEach items="${sessionScope.blist}" var="b">
        <div class="card rounded-3 mb-4">
          <div class="card-body p-4">
            <div class="row d-flex justify-content-between align-items-center">
              <div class="col-md-2 col-lg-2 col-xl-2">
                <img
                  src="${b.img}"
                  class="img-fluid rounded-3" alt="Cotton T-shirt">
              </div>
              <div class="col-md-3 col-lg-3 col-xl-3">
                <p class="lead fw-normal mb-2">${b.name}</p>
                <p><span class="text-muted">${b.price} VND </span>
              </div>
              <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                <button data-mdb-button-init data-mdb-ripple-init class="btn btn-link px-2"
                  onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                  <i class="fas fa-minus"></i>
                </button>

                  <input id="form1"  name="quantity"  type="text" value="${b.quantity}" disabled="">
                 

                <button data-mdb-button-init data-mdb-ripple-init class="btn btn-link px-2"
                  onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                  <i class="fas fa-plus"></i>
                </button>
              </div>
              <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                <h5 class="mb-0">${b.quantity*b.price} VND</h5>
              </div>
              <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                <a href="deletecart?fid=${b.id}" class="text-danger" onclick="return confirm('Xoá sản phẩm khỏi giỏ hàng??')"><i class="fas fa-trash fa-lg"> Xoá</i></a>
              </div>
            </div>
          </div>
        </div>
</c:forEach>
      

        
       

 
     <div class="card">
  <div class="card-body">
    <a href="checkout.jsp" id="buy-button-container">
      <button type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-warning btn-block btn-lg">Mua hàng</button>
    </a>
  </div>
</div>
<script>
 

 
  if (${blist}.length === 0) {

    document.getElementById('buy-button-container').style.display = 'none';
  }
</script>
      </div>
    </div>
  </div>
</section>
    </body>
</html>
