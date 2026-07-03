package com.tours.daoImpl;




	import java.sql.Connection;
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;
	
	import java.util.ArrayList;
	import java.util.List;

import com.tours.dao.HotelsDAO;
import com.tours.dto.Hotels;
	import com.tours.utility.Connector;

	public class HotelsDAOImpl implements HotelsDAO {
 private Connection con;
 public HotelsDAOImpl() {
		
		this.con=Connector.requestConnection();
	}
	    @Override
	    public void addUsers(Hotels hotels) {

	        String query = "INSERT INTO Hotels(hotelName, bookingId, roomId, roomType, hLocation) VALUES(?,?,?,?,?)";

	        try {

	            

	            PreparedStatement ps = con.prepareStatement(query);

	            ps.setString(1, hotels.getHotelName());
	            ps.setInt(2, hotels.getBookingId());
	            ps.setInt(3, hotels.getRoomId());
	            ps.setString(4, hotels.getRoomType());
	            ps.setString(5, hotels.gethLocation());

	            ps.executeUpdate();

	            System.out.println("Hotel added successfully.");

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	    }

	    @Override
	    public Hotels findById(Integer id) {

	        Hotels hotel = null;

	        String query = "SELECT * FROM Hotels WHERE hotelId=?";

	        try {

	            

	            PreparedStatement ps = con.prepareStatement(query);

	            ps.setInt(1, id);

	            ResultSet rs = ps.executeQuery();

	            if (rs.next()) {

	                hotel = new Hotels();

	                hotel.setHotelId(rs.getInt("hotelId"));
	                hotel.setHotelName(rs.getString("hotelName"));
	                hotel.setBookingId(rs.getInt("bookingId"));
	                hotel.setRoomId(rs.getInt("roomId"));
	                hotel.setRoomType(rs.getString("roomType"));
	                hotel.sethLocation(rs.getString("hLocation"));
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return hotel;
	    }

	    @Override
	    public List<Hotels> findAll() {

	        List<Hotels> list = new ArrayList<>();

	        String query = "SELECT * FROM Hotels";

	        try {

	            

	            PreparedStatement st = con.prepareStatement(query);

	            ResultSet rs = st.executeQuery(query);

	            while (rs.next()) {

	                Hotels hotel = new Hotels();

	                hotel.setHotelId(rs.getInt("hotelId"));
	                hotel.setHotelName(rs.getString("hotelName"));
	                hotel.setBookingId(rs.getInt("bookingId"));
	                hotel.setRoomId(rs.getInt("roomId"));
	                hotel.setRoomType(rs.getString("roomType"));
	                hotel.sethLocation(rs.getString("hLocation"));

	                list.add(hotel);
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return list;
	    }

	    @Override
	    public void deleteUser(Integer id) {

	        String query = "DELETE FROM Hotels WHERE hotelId=?";

	        try {

	            

	            PreparedStatement ps = con.prepareStatement(query);

	            ps.setInt(1, id);

	            int result = ps.executeUpdate();

	            if (result > 0)
	                System.out.println("Hotel deleted successfully.");
	            else
	                System.out.println("Hotel not found.");

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	    }

	    @Override
	    public void updateUser(Hotels hotels) {

	        String query = "UPDATE Hotels SET hotelName=?, bookingId=?, roomId=?, roomType=?, hLocation=? WHERE hotelId=?";

	        try {

	          

	            PreparedStatement ps = con.prepareStatement(query);

	            ps.setString(1, hotels.getHotelName());
	            ps.setInt(2, hotels.getBookingId());
	            ps.setInt(3, hotels.getRoomId());
	            ps.setString(4, hotels.getRoomType());
	            ps.setString(5, hotels.gethLocation());
	            ps.setInt(6, hotels.getHotelId());

	            int result = ps.executeUpdate();

	            if (result > 0)
	                System.out.println("Hotel updated successfully.");
	            else
	                System.out.println("Hotel not found.");

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	    }
	}

