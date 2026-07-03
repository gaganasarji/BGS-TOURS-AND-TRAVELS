package com.tours.daoImpl;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tours.dao.UsersDAO;
import com.tours.dto.Users;
import com.tours.utility.Connector;

public class UsersDAOImpl implements UsersDAO {

	private Connection con;
	public UsersDAOImpl() {
		this.con=Connector.requestConnection();
	}
    @Override
    public void addUsers(Users user) {

        String query = "INSERT INTO Users(userName, userEmail, phone, password, address) VALUES(?,?,?,?,?)";

        try {

            

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, user.getUserName());
            ps.setString(2, user.getUserEmail());
            ps.setString(3, user.getPhone());
            ps.setString(4, user.getPassword());
            ps.setString(5, user.getAddress());

            ps.executeUpdate();

            System.out.println("User added successfully.");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public Users findById(Integer id) {

        Users user = null;

        String query = "SELECT * FROM Users WHERE userId=?";

        try {

            

            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                user = new Users();

                user.setUserId(rs.getInt("userId"));
                user.setUserName(rs.getString("userName"));
                user.setUserEmail(rs.getString("userEmail"));
                user.setPhone(rs.getString("phone"));
                user.setPassword(rs.getString("password"));
                user.setAddress(rs.getString("address"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    @Override
    public List<Users> findAll() {

        List<Users> list = new ArrayList<>();

        String query = "SELECT * FROM Users";

        try {

            

            PreparedStatement st = con.prepareStatement(query);

            ResultSet rs = st.executeQuery(query);

            while (rs.next()) {

                Users user = new Users();

                user.setUserId(rs.getInt("userId"));
                user.setUserName(rs.getString("userName"));
                user.setUserEmail(rs.getString("userEmail"));
                user.setPhone(rs.getString("phone"));
                user.setPassword(rs.getString("password"));
                user.setAddress(rs.getString("address"));

                list.add(user);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public void deleteUser(Integer id) {

        String query = "DELETE FROM Users WHERE userId=?";

        try {

            

            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, id);

            int result = ps.executeUpdate();

            if (result > 0)
                System.out.println("User deleted successfully.");
            else
                System.out.println("User not found.");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public void updateUser(Users user) {

        String query = "UPDATE Users SET userName=?, userEmail=?, phone=?, password=?, address=? WHERE userId=?";

        try {

            

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, user.getUserName());
            ps.setString(2, user.getUserEmail());
            ps.setString(3, user.getPhone());
            ps.setString(4, user.getPassword());
            ps.setString(5, user.getAddress());
            ps.setInt(6, user.getUserId());

            int result = ps.executeUpdate();

            if (result > 0)
                System.out.println("User updated successfully.");
            else
                System.out.println("User not found.");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
