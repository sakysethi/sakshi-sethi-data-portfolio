-- Create database
CREATE DATABASE
IF NOT EXISTS ecommerce_db;

-- Switch to the database
USE ecommerce_db;

-- Customers table
CREATE TABLE IF NOT EXISTS customers (
  customer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  signup_date DATE NOT NULL,
  gender VARCHAR(10),
  city VARCHAR(100)
)

-- Sessions table
CREATE TABLE IF NOT EXISTS sessions (
  session_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  customer_id INT NOT NULL,
  session_start DATETIME NOT NULL,
  device_type VARCHAR(20),
  traffic_source VARCHAR(50),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);

-- Pageviews table
CREATE TABLE IF NOT EXISTS pageviews (
  pageview_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  session_id INT NOT NULL,
  page_name VARCHAR(50) NOT NULL, -- e.g. 'home','product','cart','checkout'
  view_time DATETIME NOT NULL,
  FOREIGN KEY (session_id) REFERENCES sessions(session_id) ON DELETE CASCADE
);

-- Orders table
CREATE TABLE IF NOT EXISTS orders (
  order_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  session_id INT NOT NULL,
  order_amount DECIMAL(10,2) NOT NULL,
  order_time DATETIME NOT NULL,
  FOREIGN KEY (session_id) REFERENCES sessions(session_id) ON DELETE SET NULL
);