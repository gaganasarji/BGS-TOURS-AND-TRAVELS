package com.tours.dao;

import java.util.List;

import com.tours.dto.Bookings;

public interface BookingDAO {
	void addBooking(Bookings booking);
	Bookings findById(Integer bookingId);
	List<Bookings> findAll();
	void deleteBooking(Integer bookingId);
	void updateBooking(Bookings booking);
}
