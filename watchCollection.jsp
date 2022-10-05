<jsp:include page="userDashboard.jsp" />  

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
      
