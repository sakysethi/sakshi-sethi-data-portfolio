-- schema.sql
-- Purpose - Creates the bubble_tea_shop database and defines all tables for the project.

-- Create the database
CREATE DATABASE bubble_tea_shop;

-- Verify database creation
SHOW DATABASES;

-- Switch to the database
USE bubble_tea_shop;

-- Create Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    phone VARCHAR(30),
    email VARCHAR(200),
    signup_date DATE,
    loyalty_member INT
);

-- Create Drinks table
CREATE TABLE Drinks (
    drink_id INT PRIMARY KEY,
    drink_name VARCHAR(255),
    base_type VARCHAR(50),
    size VARCHAR(20),
    base_price DECIMAL(7 , 2 )
);

-- Create Toppings table
CREATE TABLE Toppings (
    topping_id INT PRIMARY KEY,
    topping_name VARCHAR(100),
    extra_price DECIMAL(6 , 2 )
);

-- Create Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_datetime DATETIME,
    total_amount DECIMAL(8 , 2 ),
    payment_method VARCHAR(50),
    FOREIGN KEY (customer_id)
        REFERENCES Customers (customer_id)
);

-- Create OrderItems table
CREATE TABLE OrderItems (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    drink_id INT,
    size VARCHAR(20),
    sugar_level INT,
    ice_level INT,
    quantity INT,
    item_subtotal DECIMAL(8 , 2 ),
    FOREIGN KEY (order_id)
        REFERENCES Orders (order_id),
    FOREIGN KEY (drink_id)
        REFERENCES Drinks (drink_id)
);

-- Create OrderItemToppings table
CREATE TABLE OrderItemToppings (
    order_item_topping_id INT PRIMARY KEY,
    order_item_id INT,
    topping_id INT,
    topping_quantity INT,
    FOREIGN KEY (order_item_id)
        REFERENCES OrderItems (order_item_id),
    FOREIGN KEY (topping_id)
        REFERENCES Toppings (topping_id)
);

-- verify all tables exist
SHOW tables;
