<%-- 
    Document   : order
    Created on : Jun 23, 2024, 9:41:21 AM
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorigin="anonymous" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="assets/css/order.css">
    </head>
    <body>

        <form>
        <div class="container">

            <div class="row">
                <div class="col-xl-8">

                    <div class="card">
                        <div class="card-body">
                                  
                            <ol class="activity-checkout mb-0 px-4 mt-3">
                                <li class="checkout-item">
                                    <div class="avatar checkout-icon p-1">
                                        <div class="avatar-title rounded-circle bg-primary">
                                            <i class="bx bxs-receipt text-white font-size-20"></i>
                                        </div>
                                    </div>
                                    <div class="feed-item-list">
                                        <div>
                                            <h5 class="font-size-16 mb-1">Thông tin giao hàng</h5>

                                            <div class="mb-3">
                                                <form>
                                                    <div>
                                                        <div class="row">
                                                            <div class="col-lg-4">
                                                                <div class="mb-3">
                                                                    <label class="form-label" for="billing-name">Họ và tên</label>
                                                                    <input type="text" class="form-control" id="billing-name" placeholder="Enter name" name="name" value="${acc.name}">
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <div class="mb-3">
                                                                    <label class="form-label" for="billing-email-address" >Email </label>
                                                                    <input type="email" class="form-control" id="billing-email-address" placeholder="Enter email" name="email" value="${acc.email}">
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <div class="mb-3">
                                                                    <label class="form-label" for="billing-phone">Điện thoại</label>
                                                                    <input type="text" class="form-control" id="billing-phone" placeholder="Enter Phone no." name="phone" value="${acc.phone}">
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="mb-3">
                                                            <label class="form-label" for="billing-address">Địa chỉ</label>
                                                           
                                                                <input type="text" class="form-control" id="billing-phone" placeholder="Địa chỉ nhận hàng:" name="address" value="${acc.address}">
                                                        </div>

                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="checkout-item">
                                    <div class="avatar checkout-icon p-1">
                                        <div class="avatar-title rounded-circle bg-primary">
                                            <i class="bx bxs-wallet-alt text-white font-size-20"></i>
                                        </div>
                                    </div>
                                    <div class="feed-item-list">
                                        <div>
                                         
                                
                                            <div class="mb-3">
                                                <div class="row">
                                                    <div class="col-lg-4 col-sm-6">
                                                        <div data-bs-toggle="collapse">
                                                            <label class="card-radio-label mb-0">
                                                                <input type="radio" name="address" id="info-address1" class="card-radio-input" checked="">
                                                           
                                                            </label>
                                                            <div class="edit-btn bg-light  rounded">
                                                                
                                                            </div>
                                                        </div>
                                                    </div>

                                                  
                                                     <div>
                                            <h5 class="font-size-14 mb-3">Payment method :</h5>
                                            <div class="row">
                                                <div class="col-lg-3 col-sm-6">
                                                    <div data-bs-toggle="collapse">
                                                        <label class="card-radio-label">
                                                            <input type="radio" name="pay-method" id="pay-methodoption1" class="card-radio-input" disabled="">
                                                            <span class="card-radio py-3 text-center text-truncate">
                                                                <i class="bx bx-credit-card d-block h2 mb-3"></i>
                                                                  ATM/Ngân hàng
                                                                  <br> 
                                                                    <i style="color:orangered">Bảo trì</i>
                                                            </span>
                                                          
                                                        </label>
                                                    </div>
                                                </div>

                                                <div class="col-lg-3 col-sm-6">
                                                    <div>
                                                        <label class="card-radio-label">
                                                            <input type="radio" name="pay-method" id="pay-methodoption2" class="card-radio-input" disabled="">
                                                            <span class="card-radio py-3 text-center text-truncate">
                                                                <i class="bx bxl-paypal d-block h2 mb-3"></i>
                                                                Paypal
                                                                   <br> 
                                                                    <i style="color:orangered">Bảo trì</i>
                                                            </span>
                                                        </label>
                                                    </div>
                                                </div>

                                                <div class="col-lg-3 col-sm-6">
                                                    <div>
                                                        <label class="card-radio-label">
                                                            <input type="radio" name="pay-method" id="pay-methodoption3" class="card-radio-input" checked="" >

                                                            <span class="card-radio py-3 text-center text-truncate">
                                                                <i class="bx bx-money d-block h2 mb-3"></i>
                                                                <span>Thanh toán trực tiếp</span>
                                                                <br>  
                                                                <i style="color:green">Hoạt động</i>
                                                            </span>
                                                        </label>
                                                    </div>
                                                </div>

                                            </div>
                                                     </div>
                                                 
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="checkout-item">
                                    
                                    <div class="feed-item-list">
                                        
                                        
                                    </div>
                                </li>
                            </ol>
                        </div>
                    </div>

                    <div class="row my-4">
                        <div class="col">
                            <a href="ecommerce-products.html" class="btn btn-link text-muted">
                                <i class="mdi mdi-arrow-left me-1"></i> Continue Shopping </a>
                        </div> <!-- end col -->
                        <div class="col">
                            <div class="text-end mt-2 mt-sm-0">
                                <a href="buy" class="btn btn-success">
                                    <i class="mdi mdi-cart-outline me-1"></i> Mua </a>
                            </div>
                        </div> <!-- end col -->
                    </div> <!-- end row-->
                </div>
                                                                <c:set value="${sessionScope.total}" var="total"></c:set>
                <div class="col-xl-4">
                    <div class="card checkout-order-summary">
                        <div class="card-body">
                            <div class="p-3 bg-light mb-3">
                          
                            </div>
                            <div class="table-responsive">
                                <table class="table table-centered mb-0 table-nowrap">
                                    <thead>
                                        <tr>
                                            <th class="border-top-0" style="width: 110px;" scope="col">Sản phẩm</th>
                                            <th class="border-top-0" scope="col">Tên</th>
                                              <th class="border-top-0" scope="col">Số lượng mua</th>
                                            <th class="border-top-0" scope="col">Tổng giá</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${sessionScope.blist}" var="b">
                                        <tr>
                                            <th scope="row"><img src="${b.img}" alt="product-img" title="product-img" class="avatar-lg rounded"></th>
                                            <td>
                                                <h5 class="font-size-16 text-truncate"><a href="porder?fid=${b.id}" class="text-dark">${b.name}</a></h5>
                                           
                                                <p class="text-muted mb-0 mt-1">${b.price}VND</p>
                                            </td>
                                            <td> ${b.quantity}</td>
                                            <td>${b.price*b.quantity} VND</td>
                                        </tr>
                                   </c:forEach>
                                       
                                     

                                        <tr>
                                            <td colspan="2">
                                                <h5 class="font-size-14 m-0">Phí vận chuyển :</h5>
                                            </td>
                                            <td>
                                                $ 0
                                            </td>
                                        </tr>
                                                                   

                                        <tr class="bg-light">
                                            <td colspan="2">
                                                <h5 class="font-size-14 m-0">Tổng đơn: </h5>
                                            </td>
                                            <td>
                                                ${total}  VND
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end row -->

        </div>
                                            </form>  
    </body>
</html>
