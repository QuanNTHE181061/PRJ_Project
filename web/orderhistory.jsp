<%-- 
    Document   : orderhistory
    Created on : Jun 29, 2024, 10:32:40 AM
    Author     : quanpyke
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fun" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="/contentpage/navbar.jsp" %>
<%@ page import="java.util.ArrayList, java.util.Hashtable, model.OrderHistory" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="assets/css/history.css">
    </head>
    <body>
<div class="container-fluid">
 
    
    <c:forEach var="oid" items="${sessionScope.htable.keySet()}">
<div class="container">
  <!-- Title -->
             <c:set var="t1" value="${sessionScope.htable[oid]}"></c:set>
  <div class="d-flex justify-content-between align-items-center py-3">
    <h2 class="h5 mb-0"><a href="#" class="text-muted"></a> </h2>
  </div>
    <c:set value="0" var="total"></c:set>
      <c:set value="0" var="count"></c:set>
  <!-- Main content -->
    <div class="col-lg-8">
  <div class="card mb-4">
  <c:forEach var="t" items="${sessionScope.htable[oid]}">
 
  
      <!-- Details -->
      
      
          <c:if test="${count==0}">
              ${t.date}
              <c:set var="count" value="${count+1}"></c:set>              
              
          </c:if>
          <table class="table table-borderless">
            <tbody>
              <tr>
            <div class="row" >
                <div >
                <td style="width:  500px">
                    <div class="d-flex mb-2" style="width:  447px">
                    <div class="flex-shrink-0">
                      <img src="${t.f.img}" alt="" width="35" class="img-fluid">
                    </div>
                    <div class="flex-lg-grow-1 ms-3">
                      <h6 class="small mb-0"><a href="#" class="text-reset">${t.f.name}</a></h6>
                 $ ${t.f.price}
                    </div>
                  </div>
                </td>
                </div>
                <td class="quantity-column"> ${t.quantity}</td>
                <td class="text-end">${t.f.price * t.quantity} VND</td>
                <c:set var="total" value="${total+t.f.price*t.f.quantity}"></c:set>
            </div>
              </tr>
            
            </tbody>
            <tfoot>
            </c:forEach>
              <tr>
                <td colspan="2">Shipping</td>
                <td class="text-end">$0</td>
              </tr>
              
              <tr class="fw-bold">
                <td colspan="2">TOTAL</td>
                <td class="text-end">$ ${total} VND</td>
              </tr>
            </tfoot>
              
          </table>
       
      </div>
      <!-- Payment -->
      
    </div>
    <div class="col-lg-4">
      <!-- Customer Notes -->
    
  
    </div>
  </div>

</div>
</c:forEach>

    </body>
</html>
