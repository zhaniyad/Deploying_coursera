<%@ page import="com.example.studentsinfo.db.Items" %><%--
  Created by IntelliJ IDEA.
  User: nurzhansaktaganov
  Date: 09.02.2023
  Time: 10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>
<%@include file="vendor/header.jsp"%>
<div class="container">
    <div class="row mt-5">
        <div class="col-sm-12">

            <%
                Items item = (Items)request.getAttribute("item");
                if(item!=null){

            %>
            <%
                String success = request.getParameter("success");
                if(success!=null){
            %>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <strong>Item saved successfuly</strong> You should check in on some of those fields below.
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <%
                }
            %>
            <%
                String error= request.getParameter("error");
                if(error!=null){
            %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <strong>Something get wrong</strong> You should check in on some of those fields below.
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <%
                }
            %>
            <form action="/edit" method="post">

                <input type="hidden" name="id" value="<%=item.getId()%>">

                <div class="form-group">
                    <label>NAME</label>
                    <input type="text" name="name" class="form-control" value="<%=item.getName()%>">
                </div>

                <div class="form-group">
                    <label>PRICE</label>
                    <input type="number" name="price" class="form-control" value="<%=item.getPrice()%>">
                </div>

                <div class="form-group">
                    <label>AMOUNT</label>
                    <input type="number" name="amount" class="form-control" value="<%=item.getAmount()%>">
                </div>

                <div class="form-group">
                    <button class="btn btn-success">SAVE ITEM</button>
                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteItemModal">
                        DELETE ITEM
                    </button>
                </div>
            </form>
            <!-- Button trigger modal -->


            <!-- Modal -->
            <div class="modal fade" id="deleteItemModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="/delete" method="post">
                            <input type="hidden" name="id" value="<%=item.getId()%>">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Confirm your changes</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            are you serious
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">NO</button>
                            <button type="submit" class="btn btn-danger">Yes</button>
                        </div>

                        </form>
                    </div>

                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>
</div>
</body>
</html>
