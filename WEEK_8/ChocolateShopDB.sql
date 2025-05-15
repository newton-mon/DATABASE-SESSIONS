-- chocolate_shop_inventory_db_updated.sql
-- Project Title: Chocolate Shop Inventory Management System (Updated)
-- Description: Updated SQL script implementing improvements in the chocolate shop inventory management database.
-- The script includes enhancements for supplier contacts, product pricing history, inventory transactions, payment methods, discount tracking, order status history, and standardized units for product ingredients.

-- ---------------------------------------------------------------------------------------------------------------------
-- 1. Create the Database
-- ---------------------------------------------------------------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS chocolate_shop_inventory;
USE chocolate_shop_inventory;

-- ---------------------------------------------------------------------------------------------------------------------
-- 2. Updated Tables and New Tables Implementation
-- ---------------------------------------------------------------------------------------------------------------------

-- 2.1 Categories Table
-- Stores product categories such as "Dark Chocolate", "Milk Chocolate", and "Gifts".
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL UNIQUE,
    category_description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 2.2 Products Table
-- Stores product information including price, quantity, and category.
CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL UNIQUE,
    category_id INT NOT NULL,
    product_description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL,
    reorder_point INT NOT NULL DEFAULT 10,
    image_url VARCHAR(2048),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id),
    CONSTRAINT CHK_StockQuantity CHECK (stock_quantity >= 0),
    CONSTRAINT CHK_Price CHECK (price > 0)
);

-- 2.3 SupplierContacts Table
-- Allows for multiple contact methods per supplier (e.g., phone, email, WhatsApp).
CREATE TABLE SupplierContacts (
    contact_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_id INT NOT NULL,
    contact_type VARCHAR(50) NOT NULL,
    contact_value VARCHAR(255) NOT NULL,
    contact_person VARCHAR(255),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

-- 2.4 ProductPricing Table
-- Stores pricing history for each product.
CREATE TABLE ProductPricing (
    pricing_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    effective_date DATE NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- 2.5 InventoryTransactions Table
-- Tracks all inventory actions such as purchases, sales, and returns.
CREATE TABLE InventoryTransactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    transaction_type VARCHAR(50) NOT NULL,
    quantity INT NOT NULL,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    CONSTRAINT CHK_TransactionQuantity CHECK (quantity <> 0)
);

-- 2.6 PaymentMethods Table
-- Standardizes payment methods for easy updates and maintenance.
CREATE TABLE PaymentMethods (
    method_id INT AUTO_INCREMENT PRIMARY KEY,
    method_name VARCHAR(50) NOT NULL UNIQUE
);

-- Updating Payments Table to reference PaymentMethods
ALTER TABLE Payments
    ADD COLUMN method_id INT NOT NULL,
    ADD FOREIGN KEY (method_id) REFERENCES PaymentMethods(method_id),
    DROP COLUMN payment_method;

-- 2.7 Discounts Table
-- Tracks promotional discounts and applies them to orders.
CREATE TABLE Discounts (
    discount_id INT AUTO_INCREMENT PRIMARY KEY,
    discount_name VARCHAR(255) NOT NULL,
    discount_percentage DECIMAL(5, 2) NOT NULL CHECK (discount_percentage BETWEEN 0 AND 100),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

-- Updating Orders Table to reference Discounts
ALTER TABLE Orders
    ADD COLUMN discount_id INT,
    ADD FOREIGN KEY (discount_id) REFERENCES Discounts(discount_id);

-- 2.8 OrderStatusHistory Table
-- Tracks the status history of orders, allowing for multiple status updates.
CREATE TABLE OrderStatusHistory (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    status VARCHAR(50) NOT NULL,
    status_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- 2.9 Units Table
-- Standardizes units used in ingredient quantities.
CREATE TABLE Units (
    unit_id INT AUTO_INCREMENT PRIMARY KEY,
    unit_name VARCHAR(50) NOT NULL UNIQUE
);

-- Updating ProductIngredients to reference Units
ALTER TABLE ProductIngredients
    ADD COLUMN unit_id INT NOT NULL,
    ADD FOREIGN KEY (unit_id) REFERENCES Units(unit_id),
    DROP COLUMN unit;

-- ---------------------------------------------------------------------------------------------------------------------
-- End 
-- ---------------------------------------------------------------------------------------------------------------------
