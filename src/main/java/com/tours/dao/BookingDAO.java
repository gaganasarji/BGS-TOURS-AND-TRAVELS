package com.tours.dao;

public interface BookingDAO {
	void addBooking(Booking booking);
	Booking findById(Integer id);
	List<Booking> findAll();
	void deleteBooking(Integer id);
	void updateBooking(Booking booking);
}
