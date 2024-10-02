<%-- 
    Document   : edituser
    Created on : Jun 30, 2024, 4:39:39 PM
    Author     : quanpyke
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fun" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="assets/css/profile.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <c:set var="profile" value="${sessionScope.eacc}"></c:set>  
        
        <form action="uedit" method="post">   
<div class="container rounded bg-white mt-5">
        <div class="row">
            <div class="col-md-4 border-right">
            </div>
            <div class="col-md-8">
                <div class="p-3 py-5">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <div class="d-flex flex-row align-items-center back"><i class="fa fa-long-arrow-left mr-1 mb-1"></i>
                            <a href="home.jsp">  <h6>Back to home</h6> </a>
                        </div>
                        <h6 class="text-right">Edit Profile</h6>
                    </div>
                    <div class="row mt-2">
                        FullName:
                    <div class="col-md-12"><input type="text" class="form-control" placeholder="Full Name" value="${profile.name}" name="name"></div>
                   
                    </div>
                    <div class="row mt-3">
                        Email:<div class="col-md-12"><input type="text" class="form-control" placeholder="Email" value="${profile.email} " name="email"></div>
                   
                    </div>
                    <div class="row mt-3">
                      Address:<div class="col-md-12"><input type="text" class="form-control" placeholder="address" value="${profile.address}" name="address"></div>

                    </div>
                        <div class="row mt-3">
                      Phone Number: <div class="col-md-12"><input type="text" class="form-control" placeholder="Phone:" value="${profile.phone}" name="phone"></div>

                    </div>
                      
                        <div class="row mt-3">
                   Quyền tài khoản <div class="col-md-12">
                       <select name="type" >
                           <option value="0" <c:if test="${profile.type==0}"> selected </c:if>> Admin </option>
                           <option value="1"<c:if test="${profile.type==1}"> selected </c:if>>Employee</option>
                           <option value="2" <c:if test="${profile.type==2}"> selected </c:if>>Customer</option>
                       </select>
                       
                       </div>

                    </div>
                      
                      
                    
                    <div class="mt-5 text-right"><button class="btn btn-primary profile-button" type="submit">Save Profile</button></div>
                </div>
            </div>
        </div>
    </div>
                      </form>   
    </body>
</html>

