<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fun" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>Starter Page - QuickStart Bootstrap Template</title>
  <meta content="" name="description">
  <meta content="" name="keywords">


  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
 
  <!-- Fonts -->

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link rel="stylesheet" href="assets/css/footer.css">
  <!-- Main CSS File -->
  <link href="assets/css/main.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: QuickStart
  * Template URL: https://bootstrapmade.com/quickstart-bootstrap-startup-website-template/
  * Updated: Jun 06 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body class="starter-page-page">
  <c:set var="acc" value="${sessionScope.acc}"></c:set>
  
   
  <header id="header" class="header d-flex align-items-center sticky-top">
    <div class="container-fluid container-xl position-relative d-flex align-items-center">

      <a href="home.jsp" class="logo d-flex align-items-center me-auto">
        <img src="assets/img/logo.png" alt="">
        <h1 class="sitename">FreshFood</h1>
      </a>

      <nav id="navmenu" class="navmenu">
        <ul>
          <li><a href="index.html#hero">Home</a></li>
        
        
              <li class="dropdown"><a href="#"><span>Chức năng</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
            <ul>
              <li><a href="#"></a></li>
           
              <li class="dropdown"><a href="pview"><span>Xem tất cả</span> </a>
              
              </li>
           
                <c:if test="${acc.type==0}">
              <li><a href="search.jsp">Tìm kiếm</a></li>
              </c:if>
            
            </ul>
          </li>
        <c:if test="${acc.type!=2}">
          <li class="dropdown"><a href="#"><span>Quản lý</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
            <ul>
              <li><a href="#"></a></li>
           
              <li class="dropdown"><a href="#"><span>Quản lý sản phẩm</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
                <ul>
                  <li><a href="addfood.jsp">Thêm sản phẩm</a></li>
                  <li><a href="viewproduct.jsp">Xem sản phẩm</a></li>
                 
                </ul>
              </li>
           
                <c:if test="${acc.type==0}">
              <li><a href="manage">Quản lý hồ sơ người dùng</a></li>
              </c:if>
              <li><a href="statistic">Doanh số</a></li>
             
            </ul>
          </li>
        </c:if>
          <c:if test="${acc.type==0}">
               
          <li><a href="index.html#contact">Contact</a></li>
        </ul>
          </c:if>
        <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
      </nav>
     
      <c:if test="${fun:length(acc.username)==0}">
      <a class="btn-getstarted" href="login">Login</a>
</c:if>
      <c:if test="${fun:length(acc.username)>0}">
      <div>
         <nav id="navmenu" class="navmenu">
        <ul>
   
          <li class="dropdown"><a href="#"><span style="color:#5271FF">${acc.username}</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
            <ul>
              <li><a href="profile?puser=${acc.username}">Hồ sơ</a></li>
              <li class="dropdown"><a href="changepass?puser=${acc.username}"><span>Đổi mật khẩu </span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
             
             </li>
              
              <li><a href="history?puser=${acc.username}">Lịch sử mua hàng</a></li>
              <li><a href="cart?pusername=${acc.username}">Xem giỏ hàng</a></li>
                <li><a href="login.jsp">Đăng xuất</a></li>
            </ul>
          </li>
       
        </ul>
        <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
         </nav>
          
          
      </c:if>
      
    </div>
  </header>
         
  
          
          
  <section class="py-5">
    
    <div class="container px-4 px-lg-5 mt-5">
           <h5 class="fw-bolder" style="color:red">ĐANG HOT</h5>
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
        <c:forEach  items="${sessionScope.data}" var="s">
            <c:if test="${s.status=='Hot'}">
            <div class="col mb-5">
                <div class="card h-100">
                    <!-- Product image-->
                    <img class="card-img-top" src="${s.img} " style="width: 267px;height: 151px" alt="..." />
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
                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="porder?fid=${s.id}">Mua hàng 🛒</a></div>
                    </div>
                </div>
            </div>
            </c:if>
       </c:forEach >
    </div>
</section>
      <section class="py-5">
    
    <div class="container px-4 px-lg-5 mt-5">
           <h5 class="fw-bolder" style="color:green">MÓN MỚI</h5>
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
        <c:forEach  items="${sessionScope.data}" var="s">
            <c:if test="${s.status=='New'}">
            <div class="col mb-5">
                <div class="card h-100">
                    <!-- Product image-->
                    <img class="card-img-top" src="${s.img}" alt="..." style="width: 267px;height: 151px" />
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
                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="porder?fid=${s.id}">Mua hàng 🛒</a></div>
                    </div>
                </div>
            </div>
            </c:if>
       </c:forEach >
    </div>
</section>

 <footer id="footer" class="footer position-relative">
  <div class="container footer-top">
    <div class="row gy-4">
      <div class="col-md-4 footer-about d-flex align-items-center">
        <a href="data" class="logo d-flex align-items-center">
          <span class="text">Freshfood</span>
        </a>
        <div class="footer-contact pt-3">
            <h4>PRJ301</h4> 
          <p>Nguyễn Trường Quân</p>
          <p>SE1860</p>
          <p>Đại học FPT</p>
          <p class="mt-3"><strong>Phone:</strong> <span>0968356204</span></p>
          <p><strong>Email:</strong> <span>quannthe181061@fpt.edu.vn</span></p>
        </div>
      </div>
      <div class="col-md-4 social-links d-flex justify-content-center align-items-center">
        <a href=""><i class="bi bi-twitter-x"></i></a>
        <a href=""><i class="bi bi-facebook"></i></a>
        <a href=""><i class="bi bi-instagram"></i></a>
        <a href=""><i class="bi bi-linkedin"></i></a>
      </div>
    </div>
  </div>
</footer>

  <!-- Scroll Top -->
  <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Preloader -->
  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>

  <!-- Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>