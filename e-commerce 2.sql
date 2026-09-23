CREATE DATABASE ecommerce;

USE ecommerce;

CREATE TABLE Category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(100)
);

CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL UNIQUE,
    price DECIMAL(10,2) NOT NULL CHECK (price > 0),
    stock_quantity INT NOT NULL CHECK (stock_quantity >= 0),
    category_id INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

INSERT INTO Category
(category_id, category_name, description)
VALUES
(1, 'Electronics', 'Electronic gadgets and accessories'),
(2, 'Fashion', 'Clothing and fashion products'),
(3, 'Books', 'Educational and programming books'),
(4, 'Home Appliances', 'Useful appliances for home'),
(5, 'Grocery', 'Daily household grocery items');

INSERT INTO Product
(product_id, product_name, price, stock_quantity, category_id)
VALUES
(201, 'Wireless Laptop', 62000.00, 15, 1),
(202, 'Android Phone', 22000.00, 28, 1),
(203, 'Wireless Earbuds', 1800.00, 45, 1),
(204, 'Fitness Band', 2500.00, 32, 1),
(205, 'Portable Speaker', 3200.00, 20, 1),
(206, 'USB Keyboard', 950.00, 38, 1),

(207, 'Casual Shirt', 1100.00, 40, 2),
(208, 'Denim Jeans', 2100.00, 22, 2),

(209, 'Java Programming', 750.00, 25, 3),
(210, 'Database Management', 950.00, 18, 3),

(211, 'Refrigerator', 36000.00, 8, 4),
(212, 'Electric Mixer', 4500.00, 16, 4),

(213, 'Wheat Flour 5kg', 280.00, 55, 5),
(214, 'Sunflower Oil 1L', 190.00, 65, 5);

INSERT INTO Product
(product_id, product_name, price, stock_quantity, category_id)
VALUES
(215, 'Smart Tablet', 19500.00, 12, 1);

SELECT * FROM Product;

UPDATE Product
SET price = 65000.00
WHERE product_name = 'Wireless Laptop';

DELETE FROM Product
WHERE product_id = 206;

SELECT
    c.category_name,
    COUNT(p.product_id) AS product_count
FROM Category c
LEFT JOIN Product p
ON c.category_id = p.category_id
GROUP BY c.category_id, c.category_name;

SELECT
    c.category_name,
    AVG(p.price) AS average_price
FROM Category c
JOIN Product p
ON c.category_id = p.category_id
GROUP BY c.category_id, c.category_name;
