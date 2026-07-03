package com.tours.dao;

import java.util.List;

import com.tours.dto.Bookings;

public interface BookingDAO {
	void addBooking(Bookings booking);
	Bookings findById(Integer id);
	List<Bookings> findAll();
	void deleteBooking(Integer id);
	void updateBooking(Bookings booking);
}
