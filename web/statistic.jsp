<%-- 
    Document   : statistic
    Created on : Jul 1, 2024, 11:01:40 PM
    Author     : quanpyke
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fun" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="/contentpage/navbar.jsp" %><!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    
            
             
            <div class="col-md-8">
<section class="py-3 py-md-5">
  <div class="container">
    <div class="row justify-content-center">
        <h3 style="display: flex;justify-content: center">Doanh thu</h3>
      <div class="col-12 col-lg-10 col-xl-8 col-xxl-7">
        <div class="row gy-4">
          <div class="col-12 col-sm-6">
            <div class="card widget-card border-light shadow-sm">
              <div class="card-body p-4">
                <div class="row">
                  <div class="col-8">
                    <h5 class="card-title widget-card-title mb-3">Hôm nay</h5>
                    <h4 class="card-subtitle text-body-secondary m-0">${sessionScope.price0} VND</h4>
                  </div>
                  <div class="col-4">
                    <div class="d-flex justify-content-end">
                      <div class="lh-1 text-white bg-info rounded-circle p-3 d-flex align-items-center justify-content-center">
                        <i class="bi bi-1-circle fs-4"></i>
                      </div>
                    </div>
                  </div>
                </div>
              
              </div>
            </div>
          </div>
          <div class="col-12 col-sm-6">
            <div class="card widget-card border-light shadow-sm">
              <div class="card-body p-4">
                <div class="row">
                  <div class="col-8">
                    <h5 class="card-title widget-card-title mb-3">7 ngày qua</h5>
                    <h4 class="card-subtitle text-body-secondary m-0">${sessionScope.price7} VND</h4>
                  </div>
                  <div class="col-4">
                    <div class="d-flex justify-content-end">
                      <div class="lh-1 text-white bg-info rounded-circle p-3 d-flex align-items-center justify-content-center">
                        <i class="bi bi-7-circle fs-4"></i>
                      </div>
                    </div>
                  </div>
                </div>
               
              </div>
            </div>
          </div>
          <div class="col-12 col-sm-6">
            <div class="card widget-card border-light shadow-sm">
              <div class="card-body p-4">
                <div class="row">
                  <div class="col-8">
                    <h5 class="card-title widget-card-title mb-3">30 ngày qua</h5>
                    <h4 class="card-subtitle text-body-secondary m-0">${sessionScope.price30} VND</h4>
                  </div>
                  <div class="col-4">
                    <div class="d-flex justify-content-end">
                      <div class="lh-1 text-white bg-info rounded-circle p-3 d-flex align-items-center justify-content-center">
                        <i class="bi  bi-calendar-month fs-4"></i>
                      </div>
                    </div>
                  </div>
                </div>
             
              </div>
            </div>
          </div>
          <div class="col-12 col-sm-6">
            <div class="card widget-card border-light shadow-sm">
              <div class="card-body p-4">
                <div class="row">
                  <div class="col-8">
                    <h5 class="card-title widget-card-title mb-3">Tất cả</h5>
                    <h4 class="card-subtitle text-body-secondary m-0">${sessionScope.priceall} VND</h4>
                  </div>
                  <div class="col-4">
                    <div class="d-flex justify-content-end">
                      <div class="lh-1 text-white bg-info rounded-circle p-3 d-flex align-items-center justify-content-center">
                        <i class="bi bi-cart fs-4"></i>
                      </div>
                    </div>
                  </div>
                </div>
      
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
       
</section>
                </div> 
      
   
            
             
            <div class="col-md-8">
<section class="py-3 py-md-5">
  <div class="container">
    <div class="row justify-content-center">
        <h3 style="display: flex;justify-content: center">Sản phẩm bán chạy nhất</h3>
      <div class="col-12 col-lg-10 col-xl-8 col-xxl-7">
        <div class="row gy-4">
          <div class="col-12 col-sm-6">
            <div class="card widget-card border-light shadow-sm">
              <div class="card-body p-4">
                <div class="row">
                  <div class="col-8">
                    <h5 class="card-title widget-card-title mb-3">Hôm nay</h5>
                    <h4 class="card-subtitle text-body-secondary m-0">${sessionScope.f0.name}</h4>
                 Số lượng:      <h4 class="card-subtitle text-body-secondary m-0">${sessionScope.f0.quantity}</h4>
                  </div>
                  <div class="col-4">
                    <div class="d-flex justify-content-end">
                      <div class="lh-1 text-white bg-info rounded-circle p-3 d-flex align-items-center justify-content-center">
                        <i class="bi bi-1-circle fs-4"></i>
                      </div>
                    </div>
                  </div>
                </div>
              
              </div>
            </div>
          </div>
          <div class="col-12 col-sm-6">
            <div class="card widget-card border-light shadow-sm">
              <div class="card-body p-4">
                <div class="row">
                  <div class="col-8">
                    <h5 class="card-title widget-card-title mb-3">7 ngày qua</h5>
                     <h4 class="card-subtitle text-body-secondary m-0">${sessionScope.f7.name}</h4>
               Số lượng:        <h4 class="card-subtitle text-body-secondary m-0">${sessionScope.f7.quantity}</h4>
                  </div>
                  <div class="col-4">
                    <div class="d-flex justify-content-end">
                      <div class="lh-1 text-white bg-info rounded-circle p-3 d-flex align-items-center justify-content-center">
                        <i class="bi bi-7-circle fs-4"></i>
                      </div>
                    </div>
                  </div>
                </div>
               
              </div>
            </div>
          </div>
          <div class="col-12 col-sm-6">
            <div class="card widget-card border-light shadow-sm">
              <div class="card-body p-4">
                <div class="row">
                  <div class="col-8">
                    <h5 class="card-title widget-card-title mb-3">30 ngày qua</h5>
                   <h4 class="card-subtitle text-body-secondary m-0">${sessionScope.f30.name}</h4>
                Số lượng:     <h4 class="card-subtitle text-body-secondary m-0"> ${sessionScope.f30.quantity}</h4>
                  </div>
                  <div class="col-4">
                    <div class="d-flex justify-content-end">
                      <div class="lh-1 text-white bg-info rounded-circle p-3 d-flex align-items-center justify-content-center">
                        <i class="bi  bi-calendar-month fs-4"></i>
                      </div>
                    </div>
                  </div>
                </div>
             
              </div>
            </div>
          </div>
          <div class="col-12 col-sm-6">
            <div class="card widget-card border-light shadow-sm">
              <div class="card-body p-4">
                <div class="row">
                  <div class="col-8">
                        <h5 class="card-title widget-card-title mb-3">Tất cả</h5>
                             <h4 class="card-subtitle text-body-secondary m-0">${sessionScope.fall.name}</h4>
                     Số lượng: <h4 class="card-subtitle text-body-secondary m-0"> ${sessionScope.fall.quantity}</h4>
                  </div>
                  <div class="col-4">
                    <div class="d-flex justify-content-end">
                      <div class="lh-1 text-white bg-info rounded-circle p-3 d-flex align-items-center justify-content-center">
                        <i class="bi bi-cart fs-4"></i>
                      </div>
                    </div>
                  </div>
                </div>
      
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
          
</section>
          
        
    </body>
</html>
