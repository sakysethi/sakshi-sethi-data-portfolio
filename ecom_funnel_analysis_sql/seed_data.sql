--Insert Customers
INSERT INTO customers (signup_date, gender, city) VALUES
('2025-01-05','Female','Delhi'),
('2025-01-06','Male','Mumbai'),
('2025-01-07','Female','Bangalore'),
('2025-01-08','Female','Hyderabad'),
('2025-01-09','Male','Delhi'),
('2025-01-10','Female','Pune'),
('2025-01-11','Male','Kolkata'),
('2025-01-12','Female','Chennai'),
('2025-01-13','Male','Delhi'),
('2025-01-14','Female','Mumbai'),
('2025-01-15','Male','Bangalore'),
('2025-01-16','Female','Hyderabad'),
('2025-01-17','Female','Delhi'),
('2025-01-18','Male','Mumbai'),
('2025-01-19','Female','Kolkata'),
('2025-01-20','Male','Chennai'),
('2025-01-21','Female','Pune'),
('2025-01-22','Male','Delhi'),
('2025-01-23','Female','Mumbai'),
('2025-01-24','Male','Bangalore');


-- Insert Sessions (traffic sources are realistic: Google, Instagram, Email, Direct, Organic)
INSERT INTO sessions (customer_id, session_start, device_type, traffic_source) VALUES
(1, '2025-02-01 10:05:00','Mobile','Instagram'),
(1, '2025-02-05 14:20:00','Desktop','Google'),
(2, '2025-02-03 11:10:00','Mobile','Organic'),
(2, '2025-02-10 15:40:00','Tablet','Email'),
(3, '2025-02-04 16:00:00','Desktop','Google'),
(3, '2025-02-12 12:20:00','Mobile','Instagram'),
(4, '2025-02-02 09:30:00','Mobile','Direct'),
(5, '2025-02-01 18:50:00','Desktop','Google'),
(6, '2025-02-06 20:00:00','Mobile','Organic'),
(7, '2025-02-03 21:10:00','Desktop','Instagram'),
(8, '2025-02-08 10:45:00','Mobile','Email'),
(9, '2025-02-11 13:10:00','Tablet','Direct'),
(10,'2025-02-05 09:20:00','Mobile','Google'),
(11,'2025-02-07 22:00:00','Desktop','Direct'),
(12,'2025-02-04 17:50:00','Mobile','Email'),
(13,'2025-02-03 19:10:00','Desktop','Google'),
(14,'2025-02-02 11:15:00','Mobile','Instagram'),
(15,'2025-02-01 13:45:00','Desktop','Organic'),
(16,'2025-02-09 16:30:00','Mobile','Email'),
(17,'2025-02-10 18:20:00','Tablet','Google');

-- Insert Pageviews
# We simulate the real funnel: home → product → cart → checkout, but some users drop earlier.
INSERT INTO pageviews (session_id, page_name, view_time) VALUES
-- Session 1 (full funnel)
(1,'home','2025-02-01 10:05:10'),
(1,'product','2025-02-01 10:06:00'),
(1,'cart','2025-02-01 10:07:20'),
(1,'checkout','2025-02-01 10:08:00'),
-- Session 2 (drops after product)
(2,'home','2025-02-05 14:20:10'),
(2,'product','2025-02-05 14:21:05'),
-- Session 3 (only home)
(3,'home','2025-02-03 11:10:10'),
-- Session 4 (reaches cart)
(4,'home','2025-02-10 15:40:10'),
(4,'product','2025-02-10 15:41:00'),
(4,'cart','2025-02-10 15:41:55'),
-- Session 5 (checkout)
(5,'home','2025-02-04 16:00:10'),
(5,'product','2025-02-04 16:01:00'),
(5,'cart','2025-02-04 16:02:00'),
(5,'checkout','2025-02-04 16:03:00'),
-- Session 6 (product only)
(6,'home','2025-02-12 12:20:10'),
(6,'product','2025-02-12 12:21:10'),
-- Session 7 (full funnel)
(7,'home','2025-02-02 09:30:10'),
(7,'product','2025-02-02 09:31:10'),
(7,'cart','2025-02-02 09:32:05'),
(7,'checkout','2025-02-02 09:33:10');


#Insert Orders (Only sessions that reached checkout will orders)
INSERT INTO orders (session_id, order_amount, order_time) VALUES
(1, 1299.00, '2025-02-01 10:08:30'),
(5, 2599.00, '2025-02-04 16:03:20'),
(7, 999.00, '2025-02-02 09:33:40');
