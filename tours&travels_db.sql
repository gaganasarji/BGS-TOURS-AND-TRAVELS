CREATE DATABASE IF NOT EXISTS tours;
USE tours;

CREATE TABLE Users (
    userId INT AUTO_INCREMENT PRIMARY KEY,
    userName VARCHAR(100) NOT NULL,
    userEmail VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL,
    password VARCHAR(100) NOT NULL,
    address VARCHAR(255)
);

CREATE TABLE Images (
    imageId INT AUTO_INCREMENT PRIMARY KEY,
    imageUrl VARCHAR(255) NOT NULL,
    imgDescription VARCHAR(255)
);

CREATE TABLE Destinations (
    destId INT AUTO_INCREMENT PRIMARY KEY,
    city VARCHAR(100) NOT NULL,
    destDescription VARCHAR(255),
    imageId INT,
    FOREIGN KEY (imageId) REFERENCES Images(imageId)
);

CREATE TABLE Packages (
    packageId INT AUTO_INCREMENT PRIMARY KEY,
    packageName VARCHAR(100) NOT NULL,
    destId INT NOT NULL,
    duration VARCHAR(50) NOT NULL,
    price DOUBLE NOT NULL,
    description VARCHAR(255),
    imageId INT,
    FOREIGN KEY (destId) REFERENCES Destinations(destId),
    FOREIGN KEY (imageId) REFERENCES Images(imageId)
);

CREATE TABLE Bookings (
    bookingId INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
    packageId INT NOT NULL,
    travelDate DATE NOT NULL,
    bookingDate DATE NOT NULL,
    bookingStatus VARCHAR(20) NOT NULL,
    FOREIGN KEY (userId) REFERENCES Users(userId),
    FOREIGN KEY (packageId) REFERENCES Packages(packageId)
);

CREATE TABLE Hotels (
    hotelId INT AUTO_INCREMENT PRIMARY KEY,
    hotelName VARCHAR(100) NOT NULL,
    bookingId INT NOT NULL,
    roomId INT NOT NULL,
    roomType VARCHAR(50) NOT NULL,
    hLocation VARCHAR(100) NOT NULL,
    FOREIGN KEY (bookingId) REFERENCES Bookings(bookingId)
);

CREATE TABLE Payment (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_date DATE NOT NULL,
    method VARCHAR(50) NOT NULL,
    CONSTRAINT fk_booking
        FOREIGN KEY (booking_id)
        REFERENCES Bookings(bookingId) 
        ON DELETE CASCADE
        ON UPDATE CASCADE
);