<jsp:include page="userDashboard.jsp" />  
<%@ page import="MyPack.UserInfo" %>
<% UserInfo user=(UserInfo) session.getAttribute("uInfo");  %>

<div style="text-align: center;">
    <button class="btn btn-primary btn-lg text-white p-2 px-5 m-5"> Add a Movie Record</button>
</div>

<form class="mx-5 mt-5" style="margin-right:852px !important" action="ControllerServlet" method="post">
    <div class="mb-3">
      <label class="form-label">Movie Name</label>
      <input class="form-control" type="text" name="mName">
    </div>
    <div class="mb-3">
      <label class="form-label">Description</label>
      <input type="text" class="form-control" name="mDes">
    </div>
    <input type="text" hidden name="id" value="<%=user.getId()%>">
    <button type="submit" value="addMovieRecord" name="action" class="btn btn-primary">Submit</button>
</form>