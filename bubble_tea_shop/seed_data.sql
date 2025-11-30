-- seed_data.sql
-- Purpose: Inserts sample data into all tables for the bubble_tea_shop database.

-- Insert sample customers
INSERT INTO Customers (customer_id, first_name, last_name, phone, email, signup_date, loyalty_member) VALUES
(1, 'Aarav', 'Sharma', '+91-9876543210', 'aarav.sharma@example.com', '2025-01-05', 1),
(2, 'Diya',  'Patel',  '+91-9876543211', 'diya.patel@example.com',      '2025-01-10', 0),
(3, 'Kabir', 'Mehta',  '+91-9876543212', 'kabir.mehta@example.com',     '2025-01-12', 1);

INSERT INTO Drinks (drink_id, drink_name, base_type, size, base_price) VALUES
(1, 'Classic Milk Tea (Small)',  'Milk Tea', 'Small', 120.00),
(2, 'Classic Milk Tea (Medium)', 'Milk Tea', 'Medium', 140.00),
(3, 'Classic Milk Tea (Large)',  'Milk Tea', 'Large', 160.00);

INSERT INTO Toppings (topping_id, topping_name, extra_price) VALUES
(1, 'Tapioca Pearls', 20.00),
(2, 'Brown Sugar Pearls', 25.00),
(3, 'Coconut Jelly', 15.00);

INSERT INTO Orders (order_id, customer_id, order_datetime, total_amount, payment_method) VALUES
(1, 1, '2025-01-15 14:30:00', 260.00, 'UPI'),
(2, 2, '2025-01-16 12:45:00', 140.00, 'Card');

INSERT INTO OrderItems (order_item_id, order_id, drink_id, size, sugar_level, ice_level, quantity, item_subtotal) VALUES
(1, 1, 2, 'Medium', 50, 50, 1, 140.00),
(2, 1, 1, 'Small', 75, 50, 1, 120.00),
(3, 2, 3, 'Large', 50, 50, 1, 160.00);

INSERT INTO OrderItemToppings (order_item_topping_id, order_item_id, topping_id, topping_quantity) VALUES
(1, 1, 1, 1),
(2, 2, 3, 1),
(3, 3, 2, 1);

SELECT * FROM Orders;
