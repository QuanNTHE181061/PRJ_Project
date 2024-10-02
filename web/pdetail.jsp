<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fun" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="/contentpage/navbar.jsp" %>

<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Item - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <!-- Navigation-->
      
        <!-- Product section-->
        
        <c:set var="bfood" value="${sessionScope.bfood}"></c:set>
        
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="${bfood.img}" alt="..." /></div>
                    <div class="col-md-6">
                        <div class="small mb-1">${bfood.id}</div>
                        <h1 class="display-5 fw-bolder"> ${bfood.name}</h1>
                        <div class="fs-5 mb-5">
                            
                        Giá tiền:    <span><b>${bfood.price} VND</b></span>
                        </div>
                        <p class="lead">Số lượng: <b> ${bfood.quantity} </b></p>
                        



<p class="lead">Trạng thái: 
    <c:choose>
        <c:when test="${bfood.status == 'Hot'}">
            <span  style="color:red"> <b>${bfood.status}</b></span>
        </c:when>
        <c:when test="${bfood.status == 'New'}">
            <span style="color:green"><b>${bfood.status}</b></span>
        </c:when>
        <c:when test="${bfood.status == 'Hết hàng'}">
            <span style="color:orangered"><b>${bfood.status}</b></span>
        </c:when>
      
    </c:choose>
                             </p>
                        
                         
                             <form action="pcheck" method="get">
                         
                        <div class="d-flex">
                            <input type="hidden" value="${acc.username}" name="username">
                            <input type="hidden" value="${bfood.id}" name="bfood">
<input class="form-control text-center me-3" name="quantity" id="inputQuantity" type="number" min="1" value="1" style="max-width: 6rem" />

<script>
    document.getElementById('inputQuantity').max = ${bfood.quantity};
</script>
                            <c:if test="${bfood.status != 'Hết hàng'}">

                            <input class="btn btn-outline-dark flex-shrink-0" type="submit" name="buy" value="Mua ngay💵" >
                               <input class="btn btn-outline-dark flex-shrink-0" type="submit" name="buy" value="Thêm vào giỏ hàng🛒" >
                            
                               <c:set var="addcart" value="${requestScope.addcart}"></c:set>
                               <p style="color: green">${addcart}</p>
                              
                                                          </c:if >

                            
                        </div>
                       </form>
                    </div>
                </div>
            </div>
        </section>
        <!-- Related items section-->
        <section class="py-5 bg-light">
            <div class="container px-4 px-lg-5 mt-5">
                <h2 class="fw-bolder mb-4">Bạn có thể thích:</h2>
            
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                        <c:forEach var="r" items="${sessionScope.rdlist}">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="${r.img}" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">${r.name}</h5>
                                    <!-- Product price-->
                                    ${r.price}
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="porder?fid=${r.id}">Mua</a></div>
                            </div>
                         
                        </div>
                    </div>
                              </c:forEach>
                 </div>
              
            </div>
        </section>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
