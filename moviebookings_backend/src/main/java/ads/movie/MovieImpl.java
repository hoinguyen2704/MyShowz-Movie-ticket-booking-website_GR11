package ads.movie;

import ads.basic.BasicImpl;
import ads.object.MovieObject;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Scanner;

public class MovieImpl extends BasicImpl implements movie {

    public MovieImpl() {
        super("movie");
    }

    public static void main(String[] args) {

        MovieImpl movieImpl = new MovieImpl(); // Tạo đối tượng MovieImpl

        try (Scanner sc = new Scanner(System.in)) {
            System.out.print("\nInput movie name: "); // Yêu cầu người dùng nhập tên bộ phim
            String input = sc.nextLine();

            // Tìm kiếm bộ phim theo tên
            ResultSet rs = movieImpl.getMovie(input);

            try {
                if (rs != null) {
                    // Duyệt qua kết quả và in ra thông tin bộ phim
                    while (rs.next()) {
                        String movieName = rs.getString("movie_title");
                        String movieDescription = rs.getString("movie_description");
                        int movieDuration = rs.getInt("movie_duration");

                        System.out.println("Movie Name: " + movieName);
                        System.out.println("Description: " + movieDescription);
                        System.out.println("Duration: " + movieDuration + " minutes");
                    }
                } else {
                    System.out.println("No movie found with that name.");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    if (rs != null) {
                        rs.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    @Override
    public boolean addMovie(MovieObject item) {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public boolean editMovie(MovieObject item) {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public boolean delMovie(MovieObject item) {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public ArrayList<ResultSet> getMovies(String multiSelect) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public ArrayList<ResultSet> getMovies(MovieObject similar, int at, byte total) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public ResultSet getMovie(String movie_name) {
        String sql = "SELECT * FROM tbltmovies WHERE movie_title LIKE ?";

        return this.get(sql, "%" + movie_name + "%");
    }
}
