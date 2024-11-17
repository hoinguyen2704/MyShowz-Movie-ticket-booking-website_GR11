package ads.customers;

import java.sql.ResultSet;
import java.util.ArrayList;

import ads.object.MovieObject;

public interface customers {

    void registerUser(String name, String email, String password) throws Exception;

    boolean loginUser(String email, String password);

    void updateUser(String email, String name, String password, String phone) throws Exception;

}