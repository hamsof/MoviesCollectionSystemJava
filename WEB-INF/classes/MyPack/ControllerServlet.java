package MyPack;

import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ControllerServlet extends HttpServlet {

    // request handling functions

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    // request processing

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userAction = request.getParameter("action");
        if (userAction.equals("signup")) {
            addUser(request, response);
        } else if (userAction.equals("login")) {
            login(request, response);
        } else if (userAction.equals("updateMovieJSP")) {
            updateMovieJSP(request, response);
        } else if (userAction.equals("updateMovieRecord")) {
            updateMovieRecord(request, response);
        } else if (userAction.equals("deleteMovie")) {
            deleteMovieRecord(request, response);
        } else if (userAction.equals("addMovieRecord")) {
            addMovieRecord(request, response);
        }else if (userAction.equals("searchMovieRecord")) {
            searchMovieRecord(request, response);
        }
    }

    // private functions

    private void addUser(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        try {

            // getting parameter
            String Uname = request.getParameter("name");
            String Upassword = request.getParameter("password");
            String Uemail = request.getParameter("email");
            int Uage = Integer.parseInt(request.getParameter("age"));

            // sending to database using DAO and beans classes
            UserDAO uDAO = new UserDAO();
            UserInfo uInfo = new UserInfo();

            // setting bean class
            uInfo.setUage(Uage);
            uInfo.setUemail(Uemail);
            uInfo.setUpassword(Upassword);
            uInfo.setUname(Uname);

            // adding to dao
            uDAO.addUser(uInfo);

            // redirecting
            request.setAttribute("msg", "User added Successfully !");
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            PrintWriter pwt = response.getWriter();
            pwt.println(e);
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String Uname = request.getParameter("email");
            String Upassword = request.getParameter("password");

            UserDAO uDAO = new UserDAO();
            UserInfo uInfo = null;
            ArrayList<UserMovies> uMovies = null;
            uInfo = uDAO.authenticate(Uname, Upassword); // getting the profile of user

            HttpSession session = request.getSession(true);

            // check weather the user is admin or not
            if (uInfo != null && !uInfo.getIsAdmin()) {   // thats means this is a user

                uMovies = uDAO.getMoviesList(uInfo.getId()); // getting array list of movies

                session.setAttribute("uInfo", uInfo);
                session.setAttribute("movies", uMovies);
                session.setAttribute("Check", "Session is working");

                response.sendRedirect("watchCollection.jsp");

            }else if(uInfo != null && uInfo.getIsAdmin()){
                uMovies = uDAO.getMoviesListAdmin();

                session.setAttribute("uInfo", uInfo);
                session.setAttribute("movies", uMovies);

                response.sendRedirect("adminDashboard.jsp");

            } else {
                request.setAttribute("msg", "Please Enter Correct credientials!");
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    private void updateMovieJSP(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            UserDAO uDAO = new UserDAO();
            UserMovies movie = null;
            int Mid = Integer.parseInt(request.getParameter("Mid"));
            movie = uDAO.getMovieRecord(Mid);
            request.setAttribute("updateMovie", movie);
            RequestDispatcher rd = request.getRequestDispatcher("updateCollection.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    private void updateSessionArrayList(HttpServletRequest request, HttpServletResponse response, int uId)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession(false);
            ArrayList<UserMovies> uMovies;
            UserDAO uDAO = new UserDAO();
            uMovies = uDAO.getMoviesList(uId);
            session.setAttribute("movies", uMovies);
        } catch (Exception e) {
        }
    }

    private void updateMovieRecord(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            UserDAO uDAO = new UserDAO();
            UserMovies movie = new UserMovies();
            movie.setMname(request.getParameter("mName"));
            movie.setDescription(request.getParameter("mDes"));
            movie.setMid(Integer.parseInt(request.getParameter("Mid")));
            movie.setId(Integer.parseInt(request.getParameter("id")));
            System.out.println(request.getParameter("id"));
            if (uDAO.updateMovieRecord(movie)) {
                updateSessionArrayList(request, response, movie.getId());
                response.sendRedirect("watchCollection.jsp");
            }
            else{
                response.sendRedirect("login.jsp");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    private void deleteMovieRecord(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            UserDAO uDAO = new UserDAO();
            int Mid = Integer.parseInt(request.getParameter("Mid"));
            int id = Integer.parseInt(request.getParameter("id"));
            if(uDAO.deleteMovieRecord(Mid)){
                updateSessionArrayList(request, response, id);
                response.sendRedirect("watchCollection.jsp");
            }

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    private void addMovieRecord(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    try {
        UserDAO uDAO = new UserDAO();
        UserMovies movie = new UserMovies();

        movie.setMname(request.getParameter("mName"));
        movie.setDescription(request.getParameter("mDes"));
        movie.setId(Integer.parseInt(request.getParameter("id")));

        if (uDAO.addMovieRecord(movie)) {
            updateSessionArrayList(request, response, movie.getId());
            response.sendRedirect("watchCollection.jsp");
        }
        else{
            response.sendRedirect("login.jsp");
        }
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void searchMovieRecord(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    try {
        UserDAO uDAO = new UserDAO();
        UserMovies movie = new UserMovies();
        ArrayList<UserMovies> uMovies = null;

        movie.setMname(request.getParameter("mName"));
        movie.setId(Integer.parseInt(request.getParameter("id")));

        uMovies =  uDAO.searchMovieRecord(movie);
        request.setAttribute("searchMovies",uMovies);
        RequestDispatcher rd = request.getRequestDispatcher("searchCollection.jsp");
        rd.forward(request, response);

        } catch (Exception e) {
            System.out.println(e);
        }
    }

}