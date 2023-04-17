<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>

<form action="/add" method="post">
    <label>
        Name
    </label>
    <input type="text" name="item_name">

    <label>
        Price
    </label>
    <input type="text" name="item_price">

    <label>
        Amount
    </label>
    <input type="text" name="item_amount">

    <button>Add Item</button>
</form>

<%--<form action="/home" method="post">--%>
<%--    <label>TEAM: </label>--%>
<%--    <input type="text" name="team_name">--%>

<%--    <label>POINTS:</label>--%>
<%--    <input type="number" max="120" min="0" name="team_points">--%>

<%--    <button>Create team</button>--%>

<%--</form>--%>
</body>
</html>