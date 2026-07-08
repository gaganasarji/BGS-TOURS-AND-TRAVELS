package com.tours.dao;

import java.util.List;

import com.tours.dto.Payment;

public interface PaymentDAO {

	 	void addPayment(Payment payment);
	    Payment getPaymentById(Integer paymentId);
	    List<Payment> getAllPayments();
	    void updatePayment(Payment payment);
	    void deletePayment(Integer paymentId);
	    Payment getPaymentByBookingId(Integer bookingId);
}
