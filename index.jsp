
<%@page import="java.util.ArrayList" %>

<html>
	<body>
        <form action="index.jsp" method="get">
            Item: <input type="text" name="itemid"><br>
            <input type="submit">
        </form>

        <%-- Input is:<br>
        <%= request.getParameter("itemid") %> --%>

        <%
        ArrayList<String> cart =
            (ArrayList<String>) session.getAttribute("cart");
        if (cart == null) {
            out.println("new cart");
            cart = new ArrayList<String>();
        }
        else {
            out.println("found cart");
        }

        // save item to cart
        String item = request.getParameter("itemid");
        if (item != null) {
            cart.add(item);
        }

        // save cart in the session
        session.setAttribute("cart", cart);

        // display contents
        out.println("<ul>");
        for (String thing : cart) {
            out.println("<li>" + thing + "</li>");
        }
        out.println("</ul>");
        %>
	</body>
</html>
