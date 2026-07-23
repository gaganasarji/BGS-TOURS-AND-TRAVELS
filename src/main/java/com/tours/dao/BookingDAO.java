package com.tours.dao;

import java.util.List;
import com.tours.dto.Bookings;

public interface BookingDAO {

    void addBooking(Bookings booking);

    Bookings findById(Integer bookingId);

    List<Bookings> findAll();

    // Add this method
    List<Bookings> findByUserId(Integer userId);

    void deleteBooking(Integer bookingId);

    void updateBooking(Bookings booking);
}