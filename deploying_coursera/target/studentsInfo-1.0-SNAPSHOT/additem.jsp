<%--
  Created by IntelliJ IDEA.
  User: nurzhansaktaganov
  Date: 08.02.2023
  Time: 21:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="vendor/head.jsp"%>
</head>
<body>
<%@include file="vendor/header.jsp"%>
<div class="container">
    <div class="row mt-5">
        <div class="col-sm-6 offset-3">

            <%
                String success = request.getParameter("success");
                if(success!=null){
            %>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
            <strong>Item addes successfuly</strong> You should check in on some of those fields below.
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>

            <%
                }
            %>
            <form action="/additem" method="post">
                <div class="form-group">
                    <label>NAME</label>
                    <input type="text" name="name" class="form-control">
                </div>

                <div class="form-group">
                    <label>PRICE</label>
                    <input type="number" name="price" class="form-control">
                </div>

                <div class="form-group">
                    <label>AMOUNT</label>
                    <input type="number" name="amount" class="form-control">
                </div>

                <div class="form-group">
                    <button class="btn btn-success">ADD ITEM</button>
                </div>

            </form>
        </div>
    </div>
</div>


</body>
</html>
