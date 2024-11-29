use moviebooking_data;
select * from tbltcustomers

INSERT INTO tbltcustomers (customer_name, customer_email, customer_password) VALUES
('Nguyễn Tiến Hội', 'hoinguyen@2k3.com', '123456');

SELECT * FROM tbltcustomers WHERE customer_password = MD5('hashed_password222');

SELECT * FROM tbltcustomers WHERE customer_email = 'hoinguyen@2k3.com' AND (customer_password = md5("123456") or customer_password = "123456")