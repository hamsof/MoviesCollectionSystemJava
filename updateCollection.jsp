<jsp:include page="userDashboard.jsp" />  

<%@ page import="MyPack.UserMovies" %>
<% 
UserMovies movie =(UserMovies)request.getAttribute("updateMovie");
%>

<div style="text-align: center;">
<button class="btn btn-primary btn-lg text-white p-2 px-5 m-5"> Update Movie Record</button>
</div>

<form class="mx-5 mt-5" style="margin-right:852px !important" action="ControllerServlet" method="post">
    <div class="form-group">
      <label>Movie Name</label>
      <input type="text" name="mName" class="form-control" placeholder="<%=movie.getMname()%>" value="<%=movie.getMname()%>">
    </div>
    <div class="form-group">
      <label>Description</label>
      <input type="text" name="mDes" class="form-control"placeholder="<%=movie.getDescription()%>" value = "<%=movie.getDescription()%>">
      <input type="text" name="Mid" hidden value = "<%=movie.getMid()%>">
      <input type="text" name="id" hidden value = "<%=movie.getId()%>">
    </div>
    <button type="submit" name="action" value="updateMovieRecord" class="btn btn-primary">Submit</button>
</form>

<!-- 
error
trending -->
