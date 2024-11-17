 create database moviebooking_data;
 USE moviebooking_data;

-- Tạo bảng tbltcustomers (Người dùng)
CREATE TABLE tbltcustomers (
    customer_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL UNIQUE,
    customer_password VARCHAR(255) NOT NULL,
    customer_phone VARCHAR(15) NOT NULL DEFAULT '',
    customer_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    customer_is_active TINYINT DEFAULT 1
);

-- Thêm 20 bản ghi cho bảng tbltcustomers
INSERT INTO tbltcustomers (customer_name, customer_email, customer_password, customer_phone) VALUES
('John Doe', 'johndoe@example.com', 'hashed_password', '1234567890'),
('Jane Smith', 'janesmith@example.com', 'hashed_password', '0987654321'),
('Alice Johnson', 'alice.johnson@example.com', 'hashed_password', '1122334455'),
('Bob Brown', 'bob.brown@example.com', 'hashed_password', '2233445566'),
('Charlie Davis', 'charlie.davis@example.com', 'hashed_password', '3344556677'),
('Diana Evans', 'diana.evans@example.com', 'hashed_password', '4455667788'),
('Edward Wilson', 'edward.wilson@example.com', 'hashed_password', '5566778899'),
('Fiona Moore', 'fiona.moore@example.com', 'hashed_password', '6677889900'),
('George Lee', 'george.lee@example.com', 'hashed_password', '7788990011'),
('Hannah White', 'hannah.white@example.com', 'hashed_password', '8899001122'),
('Ivy Clark', 'ivy.clark@example.com', 'hashed_password', '9900112233'),
('Jack King', 'jack.king@example.com', 'hashed_password', '1011122333'),
('Katherine Scott', 'katherine.scott@example.com', 'hashed_password', '1213142434'),
('Leo Harris', 'leo.harris@example.com', 'hashed_password', '1314152535'),
('Mia Allen', 'mia.allen@example.com', 'hashed_password', '1415162636'),
('Noah Thomas', 'noah.thomas@example.com', 'hashed_password', '1516172737'),
('Olivia Young', 'olivia.young@example.com', 'hashed_password', '1617182838'),
('Paul Adams', 'paul.adams@example.com', 'hashed_password', '1718192939'),
('Quincy Baker', 'quincy.baker@example.com', 'hashed_password', '1819203030'),
('Rachel Wilson', 'rachel.wilson@example.com', 'hashed_password', '1920213131');

-- Tạo bảng tbltmovies (Phim)
CREATE TABLE tbltmovies (
    movie_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    movie_title VARCHAR(255) NOT NULL,
    movie_description TEXT,
    movie_duration INT NOT NULL,  -- Thời gian phim tính bằng phút
    movie_trailer_url VARCHAR(255),
    movie_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Thêm 20 bản ghi cho bảng tbltmovies
INSERT INTO tbltmovies (movie_title, movie_description, movie_duration, movie_trailer_url) VALUES
('Avengers: Endgame', 'The Avengers assemble to defeat Thanos.', 181, 'https://www.youtube.com/watch?v=TcMBFSGVi1c'),
('The Lion King', 'The adventure of Simba, a lion cub.', 118, 'https://www.youtube.com/watch?v=7TavVZMewpY'),
('Frozen II', 'Elsa and Anna’s journey to uncover the secrets of their past.', 103, 'https://www.youtube.com/watch?v=Zi4LMpSKP3o'),
('Spider-Man: No Way Home', 'Spider-Man teams up with his counterparts from other dimensions.', 148, 'https://www.youtube.com/watch?v=JfVOs4VgS5g'),
('Joker', 'A story about the man who became the Joker.', 122, 'https://www.youtube.com/watch?v=zAGVQLHvwOY'),
('Batman v Superman', 'Batman and Superman battle each other over their differences.', 151, 'https://www.youtube.com/watch?v=0WWzgGyAH6Y'),
('The Dark Knight', 'Batman faces off against the Joker in Gotham City.', 152, 'https://www.youtube.com/watch?v=EXeTwQWrcwY'),
('Inception', 'A skilled thief is tasked with planting an idea in someone’s mind.', 148, 'https://www.youtube.com/watch?v=YoHD9XEInc0'),
('Interstellar', 'A team of astronauts travels through a wormhole to save humanity.', 169, 'https://www.youtube.com/watch?v=Lm8p5rlrSkY'),
('Titanic', 'A love story set aboard the doomed Titanic ship.', 195, 'https://www.youtube.com/watch?v=kVrqfYjkTdQ'),
('Avatar', 'A paraplegic Marine on an alien planet helps the Na’vi people fight back.', 162, 'https://www.youtube.com/watch?v=5PSNL1qE6VY'),
('Toy Story 4', 'The toys go on a new adventure with their new friend, Forky.', 100, 'https://www.youtube.com/watch?v=wmiIUN-7qhE'),
('The Matrix', 'A hacker learns that the world is controlled by machines.', 136, 'https://www.youtube.com/watch?v=vKQi3bBA1y8'),
('Guardians of the Galaxy', 'A group of misfits must work together to save the universe.', 121, 'https://www.youtube.com/watch?v=d96cjJhvlMA'),
('Doctor Strange', 'A former surgeon becomes the Sorcerer Supreme to protect the Earth.', 115, 'https://www.youtube.com/watch?v=1vQ12a8xJSY'),
('Shazam!', 'A boy can turn into an adult superhero by saying the word "Shazam".', 132, 'https://www.youtube.com/watch?v=4vJcOCmPU8I'),
('Wonder Woman', 'Diana, an Amazonian princess, becomes Wonder Woman to fight for justice.', 141, 'https://www.youtube.com/watch?v=INoLV1qszfw'),
('Deadpool', 'A former soldier becomes the mercenary known as Deadpool.', 108, 'https://www.youtube.com/watch?v=Fy2BqQRqZGo'),
('The Avengers', 'A team of superheroes assemble to save Earth from Loki.', 143, 'https://www.youtube.com/watch?v=eOrNdBpGMv8'),
('Captain Marvel', 'Carol Danvers becomes Captain Marvel to fight against a galactic war.', 123, 'https://www.youtube.com/watch?v=Z1BCujX3pw8'),
('Thor', 'Thor, the god of thunder, must prove himself worthy to wield his magical hammer.', 115, 'https://www.youtube.com/watch?v=JOddp-nlNvQ');

-- Tạo bảng tbltrooms (Phòng chiếu)
CREATE TABLE tbltrooms (
    room_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    room_name VARCHAR(50) NOT NULL,  -- Tên phòng chiếu (Screen 1, Screen 2, v.v.)
    room_capacity INT NOT NULL,  -- Số ghế trong phòng
    room_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Thêm 20 bản ghi cho bảng tbltrooms
INSERT INTO tbltrooms (room_name, room_capacity) VALUES
('Screen 1', 150),
('Screen 2', 120),
('Screen 3', 100),
('Screen 4', 180),
('Screen 5', 120),
('Screen 6', 100),
('Screen 7', 150),
('Screen 8', 200),
('Screen 9', 170),
('Screen 10', 150),
('Screen 11', 180),
('Screen 12', 200),
('Screen 13', 100),
('Screen 14', 130),
('Screen 15', 140),
('Screen 16', 160),
('Screen 17', 180),
('Screen 18', 150),
('Screen 19', 120),
('Screen 20', 160);

-- Tạo bảng tbltseats (Ghế ngồi)
CREATE TABLE tbltseats (
    seat_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    room_id BIGINT NOT NULL,
    seat_row CHAR(3) NOT NULL, -- R1, R2, ..., R10
    seat_column CHAR(3) NOT NULL, -- S1, S2, ..., S10
    seat_status ENUM('available', 'reserved', 'booked') DEFAULT 'available',
    FOREIGN KEY (room_id) REFERENCES tbltrooms(room_id) ON DELETE CASCADE
);

-- Thêm dữ liệu mẫu cho bảng tbltseats
INSERT INTO tbltseats (room_id, seat_row, seat_column) VALUES
-- R1
(1, 'R1', 'S1'), (1, 'R1', 'S2'), (1, 'R1', 'S3'), (1, 'R1', 'S4'),
(1, 'R1', 'S5'), (1, 'R1', 'S6'), (1, 'R1', 'S7'), (1, 'R1', 'S8'),
(1, 'R1', 'S9'), (1, 'R1', 'S10'),
-- R2
(1, 'R2', 'S1'), (1, 'R2', 'S2'), (1, 'R2', 'S3'), (1, 'R2', 'S4'),
(1, 'R2', 'S5'), (1, 'R2', 'S6'), (1, 'R2', 'S7'), (1, 'R2', 'S8'),
(1, 'R2', 'S9'), (1, 'R2', 'S10'),
-- R3
(1, 'R3', 'S1'), (1, 'R3', 'S2'), (1, 'R3', 'S3'), (1, 'R3', 'S4'),
(1, 'R3', 'S5'), (1, 'R3', 'S6'), (1, 'R3', 'S7'), (1, 'R3', 'S8'),
(1, 'R3', 'S9'), (1, 'R3', 'S10'),
-- R4 (Bỏ R4-S9, R4-S10)
(1, 'R4', 'S1'), (1, 'R4', 'S2'), (1, 'R4', 'S3'), (1, 'R4', 'S4'),
(1, 'R4', 'S5'), (1, 'R4', 'S6'), (1, 'R4', 'S7'), (1, 'R4', 'S8'),
-- R5
(1, 'R5', 'S1'), (1, 'R5', 'S2'), (1, 'R5', 'S3'), (1, 'R5', 'S4'),
(1, 'R5', 'S5'), (1, 'R5', 'S6'), (1, 'R5', 'S7'), (1, 'R5', 'S8'),
(1, 'R5', 'S9'), (1, 'R5', 'S10'),
-- R6
(1, 'R6', 'S1'), (1, 'R6', 'S2'), (1, 'R6', 'S3'), (1, 'R6', 'S4'),
(1, 'R6', 'S5'), (1, 'R6', 'S6'), (1, 'R6', 'S7'), (1, 'R6', 'S8'),
(1, 'R6', 'S9'), (1, 'R6', 'S10'),
-- R7
(1, 'R7', 'S1'), (1, 'R7', 'S2'), (1, 'R7', 'S3'), (1, 'R7', 'S4'),
(1, 'R7', 'S5'), (1, 'R7', 'S6'), (1, 'R7', 'S7'), (1, 'R7', 'S8'),
(1, 'R7', 'S9'), (1, 'R7', 'S10'),
-- R8
(1, 'R8', 'S1'), (1, 'R8', 'S2'), (1, 'R8', 'S3'), (1, 'R8', 'S4'),
(1, 'R8', 'S5'), (1, 'R8', 'S6'), (1, 'R8', 'S7'), (1, 'R8', 'S8'),
(1, 'R8', 'S9'), (1, 'R8', 'S10'),
-- R9
(1, 'R9', 'S1'), (1, 'R9', 'S2'), (1, 'R9', 'S3'), (1, 'R9', 'S4'),
(1, 'R9', 'S5'), (1, 'R9', 'S6'), (1, 'R9', 'S7'), (1, 'R9', 'S8'),
(1, 'R9', 'S9'), (1, 'R9', 'S10'),
-- R10 (Bỏ R10-S1, R10-S2, R10-S9, R10-S10)
(1, 'R10', 'S3'), (1, 'R10', 'S4'), (1, 'R10', 'S5'), (1, 'R10', 'S6'),
(1, 'R10', 'S7'), (1, 'R10', 'S8');

-- Tạo bảng tbltshowtimes (Lịch chiếu)
CREATE TABLE tbltshowtimes (
    showtime_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    movie_id BIGINT NOT NULL,
    room_id BIGINT NOT NULL,
    show_date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    ticket_price DECIMAL(10, 2) NOT NULL,  -- Giá vé cho buổi chiếu
    showtime_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    showtime_updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (movie_id) REFERENCES tbltmovies(movie_id) ON DELETE CASCADE,
    FOREIGN KEY (room_id) REFERENCES tbltrooms(room_id) ON DELETE CASCADE
);

-- Thêm 20 bản ghi cho bảng tbltshowtimes
INSERT INTO tbltshowtimes (movie_id, room_id, show_date, start_time, end_time, ticket_price) VALUES
(1, 1, '2024-01-01', '14:00:00', '17:00:00', 10.00),
(2, 2, '2024-01-01', '16:00:00', '18:00:00', 12.00),
(3, 3, '2024-01-01', '18:00:00', '20:00:00', 15.00),
(4, 4, '2024-01-02', '13:00:00', '15:30:00', 12.00),
(5, 5, '2024-01-02', '16:00:00', '18:00:00', 14.00),
(6, 6, '2024-01-02', '18:30:00', '20:30:00', 15.00),
(7, 7, '2024-01-03', '14:30:00', '17:00:00', 13.00),
(8, 8, '2024-01-03', '17:30:00', '19:30:00', 16.00),
(9, 9, '2024-01-03', '20:00:00', '22:00:00', 18.00),
(10, 10, '2024-01-04', '15:00:00', '17:00:00', 10.00),
(11, 11, '2024-01-04', '16:30:00', '18:30:00', 12.00),
(12, 12, '2024-01-04', '19:00:00', '21:00:00', 14.00),
(13, 13, '2024-01-05', '14:00:00', '16:00:00', 16.00),
(14, 14, '2024-01-05', '16:30:00', '18:30:00', 17.00),
(15, 15, '2024-01-06', '13:00:00', '15:00:00', 18.00),
(16, 16, '2024-01-06', '15:30:00', '17:30:00', 19.00),
(17, 17, '2024-01-06', '18:00:00', '20:00:00', 15.00),
(18, 18, '2024-01-07', '14:00:00', '16:00:00', 14.00),
(19, 19, '2024-01-07', '16:30:00', '18:30:00', 13.00),
(20, 20, '2024-01-07', '19:00:00', '21:00:00', 20.00);

-- Tạo bảng tbltbookings (Đặt vé)
CREATE TABLE tbltbookings (
    booking_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    customer_id BIGINT NOT NULL,
    showtime_id BIGINT NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,  -- Tổng giá vé
    booking_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES tbltcustomers(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (showtime_id) REFERENCES tbltshowtimes(showtime_id) ON DELETE CASCADE
);

-- Thêm 20 bản ghi cho bảng tbltbookings
INSERT INTO tbltbookings (customer_id, showtime_id, total_price) VALUES
(1, 1, 30.00),
(2, 2, 24.00),
(3, 3, 45.00),
(4, 4, 34.00),
(5, 5, 28.00),
(6, 6, 30.00),
(7, 7, 39.00),
(8, 8, 32.00),
(9, 9, 36.00),
(10, 10, 22.00),
(11, 11, 24.00),
(12, 12, 28.00),
(13, 13, 30.00),
(14, 14, 33.00),
(15, 15, 37.00),
(16, 16, 38.00),
(17, 17, 35.00),
(18, 18, 28.00),
(19, 19, 32.00),
(20, 20, 40.00);

-- Tạo bảng tbltbooking_seats (Ghế đã chọn trong vé)
CREATE TABLE tbltbooking_seats (
    booking_seat_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    booking_id BIGINT NOT NULL,
    seat_id BIGINT NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES tbltbookings(booking_id) ON DELETE CASCADE,
    FOREIGN KEY (seat_id) REFERENCES tbltseats(seat_id) ON DELETE CASCADE
);

-- Thêm 20 bản ghi cho bảng tbltbooking_seats
INSERT INTO tbltbooking_seats (booking_id, seat_id) VALUES
(1, 3),
(2, 1),
(2, 2),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10),
(10, 11),
(11, 12),
(12, 13),
(13, 14),
(14, 15),
(15, 16),
(16, 17),
(17, 18),
(18, 19),
(19, 20);
