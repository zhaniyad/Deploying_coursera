<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.studentsinfo.db.Items" %><%--
  Created by IntelliJ IDEA.
  User: nurzhansaktaganov
  Date: 08.02.2023
  Time: 17:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="vendor/head.jsp" %>
</head>
<body>

<%@include file="vendor/header.jsp"%>

<div class="container">
    <div class="row mt-5">
        <div class="col sm-12">
            <table class="table">




                <!-- HTML part of Option list and Search field -->

                <form action="/search" method="get">

                    <label for="detTech">Choose a value:</label>

                    <select id="detTech" name="listtechs">
                        <option value="np">-</option>
                        <option value="ido">ID</option>
                        <option value="nameo">Name</option>
                        <option value="priceo">Price</option>
                        <option value="amounto">Amount</option>
                    </select>


                    <div class="input-group">
                        <div class="form-outline">
                            <input name="sname" type="search" id="form1" class="form-control"  />
                        </div>
                        <button type="submit" class="btn btn-primary"></button>
                    </div>
                </form>



                <thead>
                <tr>
                    <th>ID</th>
                    <th>NAME</th>
                    <th>PRICE</th>
                    <th>AMOUNT</th>
                    <th>DETAILS</th>
                </tr>
                </thead>

                <tbody>
                <%
                    ArrayList<Items> items = (ArrayList<Items>) request.getAttribute("tovary");
                    if(items!=null){

                        for(Items it : items){

                %>
                <tr>
                    <td>
                        <%=it.getId()%>
                    </td>

                    <td>
                        <%=it.getName()%>
                    </td>

                    <td>
                        <%=it.getPrice()%>
                    </td>

                    <td>
                        <%=it.getAmount()%>
                    </td>

                    <td>
                        <a href="/details?id=<%=it.getId() %>" class="btn btn-info btn-sm">DETAILS</a>
                    </td>


                </tr>
                <%
                        }
                    }
                %>
                </tbody>
            </table>
        </div>

    </div>
</div>
</body>
</html>
