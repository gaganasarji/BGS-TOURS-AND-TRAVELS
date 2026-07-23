package com.tours.daoImpl;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tours.dao.BookingDAO;
import com.tours.dto.Bookings;
import com.tours.utility.Connector;

	

	public class BookingsDAOImpl implements BookingDAO {
		private Connection con;
		public BookingsDAOImpl() {
			
			this.con=Connector.requestConnection();
		}
	    @Override
	    public void addBooking(Bookings booking) {

	        String query = "INSERT INTO Bookings(userId, packageId, travelDate, bookingDate, bookingStatus) VALUES(?,?,?,?,?)";

	        try {
	            

	            PreparedStatement ps = con.prepareStatement(query);

	            ps.setInt(1, booking.getUserId());
	            ps.setInt(2, booking.getPackageId());
	            ps.setString(3, booking.getTravelDate());
	            ps.setString(4, booking.getBookingDate());
	            ps.setString(5, booking.getBookingStatus());

	            ps.executeUpdate();

	            System.out.println("Booking added successfully.");

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

	    @Override
	    public Bookings findById(Integer bookingId) {

	        Bookings booking = null;

	        String query = "SELECT * FROM Bookings WHERE bookingId=?";

	        try {

	           

	            PreparedStatement ps = con.prepareStatement(query);

	            ps.setInt(1, bookingId);

	            ResultSet rs = ps.executeQuery();

	            if (rs.next()) {

	                booking = new Bookings();

	                booking.setBookingId(rs.getInt("bookingId"));
	                booking.setUserId(rs.getInt("userId"));
	                booking.setPackageId(rs.getInt("packageId"));
	                booking.setTravelDate(rs.getString("travelDate"));
	                booking.setBookingDate(rs.getString("bookingDate"));
	                booking.setBookingStatus(rs.getString("bookingStatus"));
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return booking;
	    }

	    @Override
	    public List<Bookings> findAll() {

	        List<Bookings> list = new ArrayList<>();

	        String query = "SELECT * FROM Bookings";

	        try {

	            

	            PreparedStatement st = con.prepareStatement(query);

	            ResultSet rs = st.executeQuery();

	            while (rs.next()) {

	                Bookings booking = new Bookings();

	                booking.setBookingId(rs.getInt("bookingId"));
	                booking.setUserId(rs.getInt("userId"));
	                booking.setPackageId(rs.getInt("packageId"));
	                booking.setTravelDate(rs.getString("travelDate"));
	                booking.setBookingDate(rs.getString("bookingDate"));
	                booking.setBookingStatus(rs.getString("bookingStatus"));

	                list.add(booking);
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return list;
	    }

	    @Override
	    public void deleteBooking(Integer bookingId) {

	        String query = "DELETE FROM Bookings WHERE bookingId=?";

	        try {

	           

	            PreparedStatement ps = con.prepareStatement(query);

	            ps.setInt(1, bookingId);

	            int result = ps.executeUpdate();

	            if (result > 0)
	                System.out.println("Booking deleted successfully.");
	            else
	                System.out.println("Booking not found.");

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    
	    @Override
	    public List<Bookings> findByUserId(Integer userId) {

	        List<Bookings> list = new ArrayList<>();

	        String query = "SELECT * FROM Bookings WHERE userId=?";

	        try {

	            PreparedStatement ps = con.prepareStatement(query);
	            ps.setInt(1, userId);

	            ResultSet rs = ps.executeQuery();

	            while (rs.next()) {

	                Bookings booking = new Bookings();

	                booking.setBookingId(rs.getInt("bookingId"));
	                booking.setUserId(rs.getInt("userId"));
	                booking.setPackageId(rs.getInt("packageId"));
	                booking.setTravelDate(rs.getString("travelDate"));
	                booking.setBookingDate(rs.getString("bookingDate"));
	                booking.setBookingStatus(rs.getString("bookingStatus"));

	                list.add(booking);
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return list;
	    }
	    
	    
	    
	    
	    
	    

	    @Override
	    public void updateBooking(Bookings booking) {

	        String query = "UPDATE Bookings SET userId=?, packageId=?, travelDate=?, bookingDate=?, bookingStatus=? WHERE bookingId=?";

	        try {

	           

	            PreparedStatement ps = con.prepareStatement(query);

	            ps.setInt(1, booking.getUserId());
	            ps.setInt(2, booking.getPackageId());
	            ps.setString(3, booking.getTravelDate());
	            ps.setString(4, booking.getBookingDate());
	            ps.setString(5, booking.getBookingStatus());
	            ps.setInt(6, booking.getBookingId());

	            int result = ps.executeUpdate();

	            if (result > 0)
	                System.out.println("Booking updated successfully.");
	            else
	                System.out.println("Booking not found.");

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	}

