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
    <title>Admin</title>
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
    <!--making sure its admin and user-->

    <%@ page import ="MyPack.UserInfo" %>
    <% session = request.getSession(false);
    UserInfo user = (UserInfo) session.getAttribute("uInfo");
    if(user == null || !user.getIsAdmin()){
        request.setAttribute("msg", "Please Login as Admin to see the dashboard !");
        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
        rd.forward(request, response);
    }
    %>

    <section class="head">
        <div class="d-flex text-center justify-content-between py-4 px-4 customBgColor align-items-center">
            <div style="font-family: 'Oswald', sans-serif; font-size: large;"> User Dashboard </div>
            <div style="font-family: 'Oswald', sans-serif; font-size: xx-large;">Welcome <%= user.getUname()
                    %> !</div>
            <div class="d-flex align-items-center">
                    <button class="btn btn-sm btn-primary mx-2"> <a href="logout.jsp"
                            class="text-white">Logout</a>
                    </button>
            </div>
        </div>
        </div>
    </section>



    <table class="table" style="margin-top:50px ;">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">Movie Name</th>
            <th scope="col">Description</th>
            <th scope="col">Update</th>
          </tr>
        </thead>
        <tbody>
    
          <%@ page import="MyPack.UserMovies, java.util.ArrayList" %>
          <%
          ArrayList <UserMovies> movies= (ArrayList<UserMovies>)session.getAttribute("movies");
          UserMovies movie = null;
          for (int i=0;i<movies.size();i++){
            movie = movies.get(i);
          %>
            <tr>
              <th scope="row"><%= i+1 %></th>
              <td><%= movie.getMname() %></td>
              <td><%= movie.getDescription() %></td>
              <td class="d-flex">
              <div class="btn btn-outline-success btn-sm me-2"> 
              <a href="ControllerServlet?action=updateMovieJSP&Mid=<%=movie.getMid()%>" >Update</a> 
              </div>
              <div class="btn btn-outline-danger btn-sm">
              <a href="ControllerServlet?action=deleteMovie&Mid=<%=movie.getMid()%>&id=<%=movie.getId()%>">Delete</a>
              </div>
              </td>
            </tr>
          <% } %>
        </tbody>
      </table>

</body>
</html>