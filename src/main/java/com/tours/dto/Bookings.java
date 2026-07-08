package com.tours.dto;

public class Bookings {
	private Integer bookingId;
	 private Integer userId;
	    private Integer packageId;
	    private String travelDate;
	    private String bookingDate;
	    private String bookingStatus;
		
	   
		public Integer getUserId() {
			return userId;
		}
		public void setUserId(Integer userId) {
			this.userId = userId;
		}
		public Integer getPackageId() {
			return packageId;
		}
		public void setPackageId(Integer packageId) {
			this.packageId = packageId;
		}
		public String getTravelDate() {
			return travelDate;
		}
		public void setTravelDate(String travelDate) {
			this.travelDate = travelDate;
		}
		public String getBookingDate() {
			return bookingDate;
		}
		public void setBookingDate(String bookingDate) {
			this.bookingDate = bookingDate;
		}
		public String getBookingStatus() {
			return bookingStatus;
		}
		public void setBookingStatus(String bookingStatus) {
			this.bookingStatus = bookingStatus;
		}
		public Integer getBookingId() {
			return bookingId;
		}
		public void setBookingId(Integer bookingId) {
			this.bookingId = bookingId;
		}
		
		
		 @Override
			public String toString() {
				return "Bookings [bookingId=" + bookingId + ", userId=" + userId + ", packageId=" + packageId
						+ ", travelDate=" + travelDate + ", bookingDate=" + bookingDate + ", bookingStatus=" + bookingStatus
						+ "]";
			}
		 public Integer getHotelId() {
			 return HotelId;
		 }
}
