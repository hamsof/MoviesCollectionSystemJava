package MyPack;
import java.sql.*;
import java.util.ArrayList;



public class UserDAO {

    private Connection con;

    public UserDAO() throws ClassNotFoundException, SQLException {
        establishConnection();
    }

    // database connection
    private void establishConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://127.0.0.1/project";
        con = DriverManager.getConnection(url, "root", "root");
    }

    public void addUser(MyPack.UserInfo user) throws SQLException {

        String sql = " INSERT INTO signup (email,name,age,isAdmin,password) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement pStmt = con.prepareStatement(sql);

        

        String Uname = user.getUname();
        String Uemail = user.getUemail();
        String Upassword = user.getUpassword();
        int Uage = user.getUage();

        System.out.println("I am here");

        pStmt.setString(1, Uemail);
        pStmt.setString(2, Uname);
        pStmt.setInt(3, Uage);
        pStmt.setBoolean(4, false);
        pStmt.setString(5, Upassword);

        int e = pStmt.executeUpdate();
    }
    public UserInfo authenticate(String email,String password) throws SQLException{
        String sql = "SELECT * FROM signup WHERE email = '"+email+"' && PASSWORD = '"+password+"'";
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(sql);
        UserInfo user = null;

        //if user present return a user
        while(rs.next()){
            user = new UserInfo();
            user.setUemail(rs.getString("email"));
            user.setIsAdmin(rs.getBoolean("isAdmin"));
            user.setId(rs.getInt("Id"));
            user.setUname(rs.getString("name"));
            return user;
        }

        //else null
        return user;
    }

    //gettinng movies
    public ArrayList<UserMovies> getMoviesList(int id) throws SQLException{
        String sql = "SELECT * FROM movies WHERE id = "+id+"";
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(sql);

        ArrayList <UserMovies> movieList = new ArrayList<UserMovies>();

        String name;
        String description;
        int Mid;

        while(rs.next()){
           name = rs.getString("movie");
           description = rs.getString("description");
           Mid = rs.getInt("Mid");

           UserMovies movie = new UserMovies();
           movie.setMname(name);
           movie.setDescription(description);
           movie.setId(id);
           movie.setMid(Mid);

           movieList.add(movie);
        }

        //else null
        return movieList;
    }

    public ArrayList<UserMovies> getMoviesListAdmin() throws SQLException{
        String sql = "SELECT * FROM movies";
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(sql);

        ArrayList <UserMovies> movieList = new ArrayList<UserMovies>();

        String name;
        String description;
        int Mid;
        int id;

        while(rs.next()){
           name = rs.getString("movie");
           description = rs.getString("description");
           Mid = rs.getInt("Mid");
           id = rs.getInt("id");

           UserMovies movie = new UserMovies();
           movie.setMname(name);
           movie.setDescription(description);
           movie.setId(id);
           movie.setMid(Mid);

           movieList.add(movie);
        }

        //else null
        return movieList;
    }

    public UserMovies getMovieRecord(int Mid) throws SQLException{
        String sql = "SELECT * FROM movies WHERE Mid = "+Mid+"";
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(sql);

        String name;
        String description;
        int id;
        UserMovies movie = new UserMovies();

        while(rs.next()){
            name = rs.getString("movie");
            description = rs.getString("description");
            id =  rs.getInt("id");

            movie.setMname(name);
            movie.setDescription(description);
            movie.setMid(Mid);
            movie.setId(id);
         }
        return movie;
    }

    public boolean updateMovieRecord(UserMovies movie) throws SQLException{
        String sql = "UPDATE movies SET movie = '"+movie.getMname()+"', description= '"+movie.getDescription()+"' WHERE Mid = "+movie.getMid()+"";
        Statement st = con.createStatement();
        int rs = st.executeUpdate(sql);
        if(rs > 0){
            return true;
        }
        return false;
    }

    public boolean deleteMovieRecord(int Mid) throws SQLException{
        String sql = "DELETE FROM movies WHERE Mid = "+Mid+"";
        Statement st = con.createStatement();
        int rs = st.executeUpdate(sql);
        if(rs > 0){
            return true;
        }
        return false;
    }

    public boolean addMovieRecord(UserMovies movie) throws SQLException{
        String sql = "INSERT INTO movies(Id,movie,description) VALUES("+movie.getId()+",'"+movie.getMname()+"', '"+movie.getDescription()+"') ";
        Statement st = con.createStatement();
        int rs = st.executeUpdate(sql);
        if(rs > 0){
            return true;
        }
        return false;
    }

    public ArrayList<UserMovies> searchMovieRecord(UserMovies movie) throws SQLException{
        String sql = "SELECT * FROM movies where movie LIKE '%"+movie.getMname()+"%'&& Id = "+movie.getId()+"";
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(sql);

        ArrayList <UserMovies> movieList = new ArrayList<UserMovies>();

        String name;
        String description;

        while(rs.next()){
           name = rs.getString("movie");
           description = rs.getString("description");

           UserMovies movies = new UserMovies();
           movies.setMname(name);
           movies.setDescription(description);

           movieList.add(movies);
        }

        //else null
        return movieList;
    }

}
