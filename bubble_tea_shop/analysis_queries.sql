-- analysis_queries.sql
-- Purpose: Contains SQL analysis queries for the bubble_tea_shop project.

SELECT 
    COUNT(*) AS total_orders
FROM
    Orders;

-- 2. Total number of customers
SELECT 
    COUNT(*) AS total_customers
FROM
    Customers;

-- 3. All drinks name
SELECT 
    drink_name
FROM
    Drinks;

-- 4. All orders with their customer’s first name
SELECT 
    Orders.order_id, Customers.first_name
FROM
    Orders
        JOIN
    Customers ON Orders.customer_id = Customers.customer_id

-- 5. Each order along with the total number of items in that order
SELECT 
    Orders.order_id,
    COUNT(OrderItems.order_item_id) AS total_items
FROM
    Orders
        JOIN
    OrderItems ON Orders.order_id = OrderItems.order_id
GROUP BY Orders.order_id

-- 6. each drink name and how many times it was ordered (total quantity)
SELECT 
    Drinks.drink_name, SUM(OrderItems.quantity) AS total_ordered
FROM
    Drinks
        JOIN
    OrderItems ON Drinks.drink_id = OrderItems.drink_id
GROUP BY Drinks.drink_name

-- 7. each topping and how many times it was used across all orders
SELECT 
    Toppings.topping_name,
    COUNT(OrderItemToppings.topping_id) AS times_used
FROM
    Toppings
        JOIN
    OrderItemToppings ON Toppings.topping_id = OrderItemToppings.topping_id
GROUP BY Toppings.topping_name

-- 8. each customer and how many orders they have placed
SELECT 
    Customers.customer_id,
    COUNT(Orders.order_id) AS total_orders
FROM
    Customers
        LEFT JOIN
    Orders ON Customers.customer_id = Orders.customer_id
GROUP BY Customers.customer_id

-- 9. all orders with their total amount, sorted from highest to lowest
SELECT 
    order_id, total_amount
FROM
    Orders
ORDER BY total_amount DESC

-- 10. the average item_subtotal for each drink
SELECT 
    Drinks.drink_name,
    AVG(OrderItems.item_subtotal) AS avg_item_price
FROM
    Drinks
        JOIN
    OrderItems ON Drinks.drink_id = OrderItems.drink_id
GROUP BY Drinks.drink_name

-- 11. For each order, the total toppings used in that order
SELECT 
    OrderItems.order_id,
    COUNT(OrderItemToppings.order_item_topping_id) AS total_toppings
FROM
    OrderItems
        JOIN
    OrderItemToppings ON OrderItems.order_item_id = OrderItemToppings.order_item_id
GROUP BY OrderItems.order_id

-- 12. the top 5 customers by lifetime value (total amount spent)
SELECT 
    Customers.customer_id,
    SUM(Orders.total_amount) AS lifetime_value
FROM
    Customers
        JOIN
    Orders ON Customers.customer_id = Orders.customer_id
GROUP BY Customers.customer_id
ORDER BY lifetime_value DESC
LIMIT 5

-- 13. total revenue for each drink base_type (Milk Tea, Fruit Tea, Tea)
SELECT 
    Drinks.base_type,
    SUM(OrderItems.item_subtotal) AS total_revenue
FROM
    Drinks
        JOIN
    OrderItems ON Drinks.drink_id = OrderItems.drink_id
GROUP BY Drinks.base_type

-- 14. the most popular sugar_level (0, 25, 50, 75, 100) and how many times each level was chosen
SELECT 
    sugar_level, COUNT(*) AS times_chosen
FROM
    OrderItems
GROUP BY sugar_level
ORDER BY times_chosen DESC

-- 15. each order_id and the total number of drinks (sum of quantities) in that order
SELECT 
    Orders.order_id, SUM(OrderItems.quantity) AS drinks_in_order
FROM
    Orders
        JOIN
    OrderItems ON Orders.order_id = OrderItems.order_id
GROUP BY Orders.order_id

-- 16. each topping and the total revenue it generated
SELECT 
    OrderItemToppings.topping_id,
    SUM(OrderItems.item_subtotal) AS total_revenue
FROM
    OrderItemToppings
        JOIN
    OrderItems ON OrderItemToppings.order_item_id = OrderItems.order_item_id
GROUP BY OrderItemToppings.topping_id

-- 17. all orders that include the topping 'Tapioca Pearls'
SELECT DISTINCT
    Orders.order_id, Orders.order_datetime, Orders.total_amount
FROM
    Orders
        JOIN
    OrderItems ON Orders.order_id = OrderItems.order_id
        JOIN
    OrderItemToppings ON OrderItems.order_item_id = OrderItemToppings.order_item_id
        JOIN
    Toppings ON OrderItemToppings.topping_id = Toppings.topping_id
WHERE
    Toppings.topping_name = 'Tapioca Pearls'


-- 18. the total revenue earned each day (grouped by date)
SELECT 
    DATE(order_datetime) AS order_date,
    SUM(total_amount) AS daily_revenue
FROM
    Orders
GROUP BY DATE(order_datetime)
ORDER BY order_date


-- 19. Orders by day of week
SELECT 
    DAYOFWEEK(order_datetime) AS weekday, COUNT(*) AS orders
FROM
    Orders
GROUP BY weekday
ORDER BY weekday

-- 20. Percentage of orders with at least one topping
SELECT 
    ROUND(100.0 * SUM(has_topping) / COUNT(*), 2) AS pct_with_toppings
FROM
    (SELECT 
        o.order_id,
            MAX(CASE
                WHEN oit.order_item_topping_id IS NOT NULL THEN 1
                ELSE 0
            END) AS has_topping
    FROM
        Orders o
    LEFT JOIN OrderItems oi ON o.order_id = oi.order_id
    LEFT JOIN OrderItemToppings oit ON oi.order_item_id = oit.order_item_id
    GROUP BY o.order_id) sub


