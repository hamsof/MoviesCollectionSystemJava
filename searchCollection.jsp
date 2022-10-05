<jsp:include page="userDashboard.jsp" />  
<%@ page import="MyPack.UserMovies" %>
<%@ page import="MyPack.UserInfo" %>
<% UserInfo user=(UserInfo) session.getAttribute("uInfo"); %>


<div style="text-align: center;">
    <button class="btn btn-primary btn-lg text-white p-2 px-5 m-5"> Search a Movie Record</button>
</div>

<form class="mx-5 mt-5" style="margin-right:852px !important" action="ControllerServlet" method="post">
    <div class="mb-3">
      <label class="form-label">Movie Name</label>
      <input class="form-control" type="text" name="mName">
    </div>
    <input type="text" hidden name="id" value="<%=user.getId()%>">
    <button type="submit" value="searchMovieRecord" name="action" class="btn btn-primary">Submit</button>
</form>



<table class="table" style="margin-top:50px ;">
    <thead>
      <tr>
        <th scope="col">#</th>
        <th scope="col">Movie Name</th>
        <th scope="col">Description</th>
      </tr>
    </thead>
    <tbody>

      <%@ page import="MyPack.UserMovies, java.util.ArrayList" %>
      <%
      ArrayList <UserMovies> movies= (ArrayList<UserMovies>)request.getAttribute("searchMovies");
      if(movies!=null){  
      UserMovies movie = null;
      for (int i=0;i<movies.size();i++){
        movie = movies.get(i);
      %>
        <tr>
          <th scope="row"><%= i+1 %></th>
          <td><%= movie.getMname() %></td>
          <td><%= movie.getDescription() %></td>
        </tr>
      <% } }%>
    </tbody>
</table>    


