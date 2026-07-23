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

INSERT INTO Images(imageUrl, imgDescription) VALUES
('images/mysore.jpg','Mysore Palace'),
('images/mullayanagiri.jpg','Mullayanagiri Peak'),
('images/hampi.jpg','Hampi Ruins'),
('images/kotilingeshwar.jpg','Kotilingeshwara Temple'),
('images/sakleshpur.jpg','Sakleshpur Hills'),
('images/jogfalls.jpg','Jog Falls'),
('images/chitradurga.jpg','Chitradurga Fort'),
('images/coorg.jpg','Coorg'),
('images/murudeshwar.jpg','Murudeshwar Temple'),
('images/gokarna.jpg','Om Beach Gokarna'),
('images/belur.jpg','Belur Temple'),
('images/bandipur.jpg','Bandipur National Park');


INSERT INTO Destinations(city,destDescription,imageId) VALUES
('Mysuru','Famous for Mysore Palace, Chamundi Hills and Brindavan Gardens.',1),

('Chikkamagaluru','Known for Mullayanagiri Peak, coffee plantations and scenic hills.',2),

('Hampi','UNESCO World Heritage Site with historic Vijayanagara ruins.',3),

('Kolar','Home to the famous Kotilingeshwara Temple.',4),

('Sakleshpur','Beautiful hill station with coffee estates and greenery.',5),

('Shivamogga','Known for the magnificent Jog Falls.',6),

('Chitradurga','Historic city famous for Chitradurga Fort.',7),

('Madikeri','Popular hill station in Coorg with coffee plantations.',8),

('Murudeshwar','Famous for Murudeshwar Temple and giant Shiva statue.',9),

('Gokarna','Known for Om Beach and Kudle Beach.',10),

('Belur','Famous for Chennakeshava Temple.',11),

('Bandipur','Popular wildlife sanctuary.',12);



INSERT INTO Packages(packageName,destId,duration,price,description,imageId) VALUES

('Mysore Heritage Tour',1,'2 Days / 1 Night',4999,'Explore Mysore Palace, Chamundi Hills and Brindavan Gardens.',1),

('Mullayanagiri Trek Package',2,'3 Days / 2 Nights',6999,'Experience trekking and scenic beauty at Mullayanagiri Peak.',2),

('Hampi Heritage Package',3,'2 Days / 1 Night',5499,'Visit the UNESCO World Heritage monuments of Hampi.',3),

('Kotilingeshwara Temple Tour',4,'1 Day',2499,'Explore the famous Kotilingeshwara Temple.',4),

('Sakleshpur Nature Escape',5,'2 Days / 1 Night',5999,'Enjoy coffee plantations and hills.',5),

('Jog Falls Adventure',6,'2 Days / 1 Night',6499,'Witness the magnificent Jog Falls.',6),

('Chitradurga Fort Explorer',7,'2 Days / 1 Night',4999,'Explore the historic Chitradurga Fort.',7),

('Coorg Coffee Trail',8,'3 Days / 2 Nights',7999,'Visit Abbey Falls and Raja Seat.',8),

('Murudeshwar Beach Tour',9,'2 Days / 1 Night',6999,'Visit Murudeshwar Temple and beach.',9),

('Gokarna Beach Escape',10,'3 Days / 2 Nights',7499,'Relax at Om Beach and Kudle Beach.',10),

('Belur & Halebidu Heritage Tour',11,'2 Days / 1 Night',5999,'Explore Hoysala architecture.',11),

('Bandipur Wildlife Safari',12,'2 Days / 1 Night',8499,'Enjoy wildlife safari.',12);

