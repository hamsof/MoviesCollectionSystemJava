<%@page errorPage="errorMovie.jsp" %> 

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@500&display=swap" rel="stylesheet">

    <title>User Dashboard</title>
</head>

<style>
    .customBgColor {
        background-color: #79ddd8;
        color: white
    }

    a:link,
    a:visited {
        text-decoration: none;
    }

    a,
    a:hover {
        color: inherit;
    }

    input {
        margin-bottom: 20px;
    }
</style>

<body>
    <!--Login dashboard-->
    <%@ page import="MyPack.UserInfo" %>
        <% session=request.getSession(false); 
        UserInfo user=(UserInfo) session.getAttribute("uInfo"); 
        if(user==null){ 
            request.setAttribute("msg", "Please Login to see the dashboard !" ); 
            RequestDispatcher rd=request.getRequestDispatcher("login.jsp"); 
            rd.forward(request, response); } %>
            <% //out.println(user.getId()); %>

                <section class="head">
                    <div class="d-flex text-center justify-content-between py-4 px-4 customBgColor align-items-center">
                        <div style="font-family: 'Oswald', sans-serif; font-size: xx-large;">Welcome <%= user.getUname()
                                %> !</div>
                        <div class="d-flex align-items-center">
                            <div class="me-2" style="text-decoration: underline rgb(252, 252, 252) 1px; cursor: pointer;">
                                <a href="trendingCollection.jsp" class="text-white">Trending</a>
                            </div>
                            <div class="me-2" style="text-decoration: underline  rgb(252, 252, 252) 1px; cursor: pointer;">
                                <a href="searchCollection.jsp" class="text-white">Search</a>
                            </div>
                            <div
                                style="text-decoration: underline  rgb(252, 252, 252) 1px; padding-right: 10px; cursor: pointer; list-style: none;">
                                <a href="watchCollection.jsp" class="text-white">See Collection</a>
                            </div>
                            <div style="text-decoration: underline  rgb(252, 252, 252) 1px; cursor: pointer;">
                                <a href="addCollection.jsp" class="text-white">Add Collection</a>
                            </div>
                            <div>
                                <button class="btn btn-sm btn-primary mx-2"> <a href="logout.jsp"
                                        class="text-white">Logout</a>
                            </div> </button>
                        </div>
                    </div>
                    </div>
                </section>

</body>

</html>