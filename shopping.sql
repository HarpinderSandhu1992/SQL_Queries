-- Create a database
CREATE DATABASE shopping;
-- Use shopping database for the following queries:
USE shopping;

-- Create a table
CREATE TABLE product_catergories (
id INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(255) NOT NULL
);

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    catergory_id INT,
    FOREIGN KEY (`catergory_id`) references `product_catergories` (id) ON DELETE SET NULL,
    price DECIMAL(10,2) NOT NULL,
    quantity INT
);

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    product_id INT NOT NULL,
    FOREIGN KEY  (`product_id`) references `products` (id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    order_date DATETIME NOT NULL
);

INSERT INTO product_catergories (title) VALUES ('Electronics'), ('Books'), ('Clothing');

INSERT INTO products (title, description, price, quantity, catergory_id) VALUES
('Smartphone','A high-end smartphone with a lot of features', 699.99, 50, 1),
('Laptop', 'A powerful laptop for all your needs', 999.99, 30, 1),
('Headphones', 'Noise-cancelling headphones', 199.99, 100, 1),
('Novel', 'A best-selling novel', 9.99, 200, 2),
('Textbook', 'An educational textbook', 49.99, 150, 2),
('T-shirt', 'A comfortable t-shirt', 19.99, 300, 3),
('Jeans', 'Stylish jeans', 39.99, 120, 3);

INSERT INTO orders (product_id, name, email, order_date) VALUES
(1, 'John Doe', 'john@example.com', '2024-07-28 10:00:00'),
(2, 'Jane Smith', 'jane@example.com', '2024-07-28 11:00:00'),
(3, 'Alice Johnson', 'alice@example.com', '2024-07-28 12:00:00'),
(4, 'Bob Brown', 'bob@example.com', '2024-07-28 13:00:00'),
(5, 'Carol White', 'carol@example.com', '2024-07-28 14:00:00'),
(6, 'Dave Green', 'dave@example.com', '2024-07-28 15:00:00'),
(7, 'Eve Black', 'eve@example.com', '2024-07-28 16:00:00'),
(1, 'Frank Blue', 'frank@example.com', '2024-07-28 17:00:00'),
(2, 'Grace Pink', 'grace@example.com', '2024-07-28 18:00:00'),
(3, 'Hank Yellow', 'hank@example.com', '2024-07-28 19:00:00');

-- Query 1 - Get all of the most recent orders 
SELECT * FROM orders
ORDER BY order_date desc;

-- Query 2 - Get all products belonging to the electronics catergory
SELECT * FROM products
WHERE catergory_id = 1;

-- Get the top 3 most expensive products
SELECT * FROM products
ORDER BY price desc limit 3;

-- Query 4: Get the total number of products in each category
SELECT pc.title as cateogry, COUNT(p.id) as total_products FROM product_catergories pc 
LEFT JOIN products p ON pc.id = p.catergory_id
Group BY pc.title;
 
 -- Query 5: Get the top 3 selling products based on the number of orders
 SELECT p.title, COUNT(o.id) as total_orders FROM products p
 JOIN orders o ON p.id = o.product_id
 GRoup BY p.title
 ORDER BY total_orders DESC
 LIMIT 5;
 








