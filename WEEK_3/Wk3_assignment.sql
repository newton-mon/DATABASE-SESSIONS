-- ==============================
-- Question 1: Create student table
-- ==============================
CREATE TABLE student (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Primary Key and auto-incremented
    fullName VARCHAR(100) NOT NULL,    -- Name with a maximum of 100 characters
    age INT NOT NULL                   -- Age as an integer
);

-- ==============================
-- Question 2: Insert records
-- ==============================
INSERT INTO student (fullName, age) VALUES
('Alice Johnson', 22),
('Michael Smith', 19),
('Linda Carter', 21);

-- ==============================
-- Question 3: Update age of student with ID 2
-- ==============================
UPDATE student 
SET age = 20 
WHERE id = 2;

