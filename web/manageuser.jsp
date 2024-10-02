<%-- 
    Document   : manageuser
    Created on : Jun 29, 2024, 11:25:34 PM
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
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="assets/css/manageuser.css">
    </head>
    <body>
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />

<div class="container">
<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title text-uppercase mb-0">Manage Users</h5>
            </div>
            <div class="table-responsive">
                <table class="table no-wrap user-table mb-0">
                  <thead>
                    <tr>
                        <th scope="col" class="border-0 text-uppercase font-medium">Username</th>
                      <th scope="col" class="border-0 text-uppercase font-medium">Tên</th>
                      <th scope="col" class="border-0 text-uppercase font-medium">Địa chỉ</th>
                      <th scope="col" class="border-0 text-uppercase font-medium">Liên hệ</th>
              
                      <th scope="col" class="border-0 text-uppercase font-medium">Quyền tài khoản</th>
                      <th scope="col" class="border-0 text-uppercase font-medium">Quản lý</th>
                    </tr>
                  </thead>
                  <tbody>
                      <c:forEach items="${sessionScope.acclist}" var="a">
                    <tr>
                     
                          <td>
                          <h5 class="font-medium mb-0">${a.username}</h5>
                         
                      </td>
                        
                      <td>
                          <h5 class="font-medium mb-0">${a.name}</h5>
                         
                      </td>
                      <td>
                          <span class="text-muted">${a.address}</span><
              
                      </td>
                      <td>
                          <span class="text-muted">${a.email}</span><br>
                          <span class="text-muted">${a.phone}</span>
                      </td>
                    
                      <td>

                          <c:choose>
                              <c:when test="${a.type==0}">
                                  Admin
                              </c:when>
                              <c:when test="${a.type==1}">
                                  Employee
                              </c:when>
                              <c:otherwise>
                                  Customer
                              </c:otherwise>
                          </c:choose>

                      
                      </td>
                      <td>
                          <a href="uedit?puser=${a.username}">      <button type="button" class="btn btn-outline-info btn-circle btn-lg btn-circle ml-2"><i class="fa fa-edit"></i> </button></a>   
                          <a href="udelete?puser=${a.username}"  onclick="return confirm('Bạn có muốn xoá tài khoản này?')"><button type="button" class="btn btn-outline-info btn-circle btn-lg btn-circle ml-2"><i class="fa fa-trash"></i> </button></a>  
                 
                       
                      </td>
                    </tr>
           </c:forEach>
                  </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</div>

    </body>
</html>
