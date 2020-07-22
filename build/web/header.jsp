<%@page import="sample.dtos.BillDTO"%>
<%@page import="sample.dtos.ProductsInBillDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="sample.dtos.UserDTO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header</title>
        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i"
              rel="stylesheet">
        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/flaticon.css" type="text/css">
        <link rel="stylesheet" href="style/style.css" type="text/css">

        <script src="https://use.fontawesome.com/releases/v5.11.2/js/all.js" data-auto-replace-svg="nest"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    </head>
    <body>
        <%
            UserDTO userDTO = (UserDTO) session.getAttribute("USERDTO");
            String errorMess = (String) request.getAttribute("ERRORMESSAGE");
            String roleID = null;
            if (userDTO != null) {
                roleID = userDTO.getRoleID();
            }
            String idCityHD = request.getParameter("idCity");
            if (idCityHD == null) {
                idCityHD = (String) request.getAttribute("IDCITY");
                if (idCityHD == null) {
                    idCityHD = "";
                }
            }
            String idWayHD = request.getParameter("idWay");
            if (idWayHD == null) {
                idWayHD = (String) request.getAttribute("IDWAY");
                if (idWayHD == null) {
                    idWayHD = "";
                }
            }
            String typeIDHD = request.getParameter("typeID");
            if (typeIDHD == null) {
                typeIDHD = (String) request.getAttribute("TYPEID");
                if (typeIDHD == null) {
                    typeIDHD = "";
                }
            }
            String priceLowerHD = request.getParameter("priceLower");
            String priceHigherHD = request.getParameter("priceHigher");
            if (priceLowerHD == null) {
                priceLowerHD = (String) request.getAttribute("PRICELOWER");
                if (priceLowerHD == null) {
                    priceLowerHD = "1000000";
                }
            }
            if (priceHigherHD == null) {
                priceHigherHD = (String) request.getAttribute("PRICEHIGHER");
                if (priceHigherHD == null) {
                    priceHigherHD = "100000";
                }
            }
        %>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>
        <!-- Header Section Begin -->

        <header class="header-section">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="logo">
                            <a href="MainController?action=Search">
                                <img src="img/logo-Downtown2.png" alt="" style="height: 80px; width: 240px;">
                            </a>
                        </div>
                        <ul class="main-menu">
                            <li><a href="MainController?action=Search">Home</a></li>
                                <%if (userDTO == null) {%>

                            <%
                                String urlSignup = "MainController?action=Go to signup"
                                        + "&idCity=" + idCityHD
                                        + "&idWay=" + idWayHD
                                        + "&typeID=" + typeIDHD
                                        + "&priceLower=" + priceLowerHD
                                        + "&priceHigher=" + priceHigherHD;
                            %>

                            <li><a href="<%=urlSignup%>">Sign up</a></li>
                                <%
                                    String urlLogin = "MainController?action=Go to login&"
                                            + "idCity=" + idCityHD
                                            + "&idWay=" + idWayHD
                                            + "&typeID=" + typeIDHD
                                            + "&priceLower=" + priceLowerHD
                                            + "&priceHigher=" + priceHigherHD;
                                %>
                            <li><a href="<%=urlLogin%>">Login</a></li>
                                <%} else {%>
                                <%
                                    if (roleID.equalsIgnoreCase("AD")) {
                                %>
                            <li><a href="MainController?action=ManageBill">Manage Bills</a></li>
                            <li><a href="MainController?action=ManageUser">Manage Users</a></li>
                            <li><a href="MainController?action=ManageHouse">Manage Houses</a></li>
                                <%}%>
                            <li> <a href="MainController?action=ViewDetailUser">Hi <%=userDTO.getUserName()%> !!</a></li>
                                <%
                                    if (roleID.equalsIgnoreCase("user")) {
                                %>
                            <li>
                                <button onclick="document.getElementById('items-cart').style.display = 'block'" style="background-color: #fff;">
                                    <img src="img/icons/bag2.png" alt="" style="height: 30px; width: 25px;">
                                    <span>
                                        <%
                                            String numProduct = (String) session.getAttribute("NUMPRODUCT");
                                        %>
                                        <%if (numProduct != null) {%>
                                        <%=numProduct%>
                                        <%} else {%>
                                        <% numProduct = "0";
                                            session.setAttribute("NUMPRODUCT", numProduct);
                                        %>
                                        <%=numProduct%>
                                        <%}%>
                                    </span>
                                </button>
                            </li>
                            <%}
                                }%>
                        </ul>
                        <div id="mobile-menu-wrap"></div>
                    </div>
                </div>
            </div>
        </header>

        <!--shopping-cart-->       
        <%
            List<ProductsInBillDTO> listProducts = (List<ProductsInBillDTO>) session.getAttribute("LISTPRODUCTINBILL");
            BillDTO billDTOhd = (BillDTO) session.getAttribute("BILLDTO");
            String messagePaySuccess = (String) request.getAttribute("MESSAGEPAYSUCCESS");
        %>
        <div class="items-cart" style="display: none; position: fixed; z-index: 9999;" id="items-cart">
            <table border="1" class="tblShowHouseInBill">
                <thead>
                    <tr>
                        <th>
                            <div class="title">
                                <%if (listProducts
                                            != null) {%>
                                Shopping House
                                <%}%>
                                <div class="close-items-cart">
                                    <input type="submit" class="site-btn btn-line" name="action" value="Continue shopping"
                                           onclick="document.getElementById('items-cart').style.display = 'none'"/>
                                </div>
                            </div>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <%if (messagePaySuccess
                                != null) {%>
                    <tr>
                        <td>
                            <%=messagePaySuccess%>
                        </td>
                    </tr>
                    <%}%>
                    <%
                        if (listProducts
                                != null) {
                            for (ProductsInBillDTO x : listProducts) {
                    %>
                    <tr>
                        <td>
                            <div class="item">
                                <div class="counter-item">
                                    <%=x.getIdHouse()%>
                                </div>
                                <div class="image">
                                    <img src="<%=x.getPicHouse()%>" alt=""/>
                                </div>
                                <div class="description">
                                    <span><%=x.getDescription()%></span>
                                </div>
                                <div class="price">$<%=x.getPrice()%></div>
                                <form action="MainController">
                                    <input type="hidden" name="idCity" value="<%=idCityHD%>"/>
                                    <input type="hidden" name="idWay" value="<%=idWayHD%>"/>
                                    <input type="hidden" name="typeID" value="<%=typeIDHD%>"/>
                                    <input type="hidden" name="idBill" value="<%=billDTOhd.getIdBill()%>"/>
                                    <input type="hidden" name="idHouse" value="<%=x.getIdHouse()%>"/>
                                    <input type="hidden" name="action" value="DeleteHouseInBill"/>
                                    <input type="submit" class="site-btn btn-line" value="X"/>
                                </form>
                            </div>
                        </td>
                    </tr>
                    <%
                            }
                        }
                    %>
                    <%if (billDTOhd
                                != null) {%>
                    <tr>
                        <td>
                            <div>
                                <p>  Last date change:  <%=billDTOhd.getDate()%> </p>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="total-shopping">
                                <h5>Total: $ <%=billDTOhd.getTotal()%> </h5>
                            </div>
                        </td>
                    </tr>
                    <%} else {%>
                    <tr>
                        <td>
                            <div class="total-shopping">
                                <h5>Total: $ </h5>
                            </div>
                        </td>
                    </tr>
                    <%}%>
                    <%if (errorMess
                                != null) {%>
                    <tr>
                        <td>
                            <%=errorMess%>
                        </td>
                    </tr>
                    <%}%>
                    <tr>
                        <td>
                            <%if (listProducts
                                        != null) {%>
                            <form action="MainController" method="POST">
                                <input type="hidden" name="idCity" value="<%=idCityHD%>"/>
                                <input type="hidden" name="idWay" value="<%=idWayHD%>"/>
                                <input type="hidden" name="typeId" value="<%=typeIDHD%>"/>
                                <input type="submit" class="site-btn btn-line" name="action" value="Pay" style="width: 100%;"/>
                            </form>
                            <%}%>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>                           
        <!-- Header Section End -->
        <!-- Hero Section Begin -->
        <section class="hero-section home-page set-bg" data-setbg="img/bg.jpg">
            <div class="container hero-text text-white">
                <h2>Find your next</h2>
                <h1>dream home</h1>
            </div>
        </section>

        <%@include file="searchComponents.jsp" %>
    </body>

</html>  