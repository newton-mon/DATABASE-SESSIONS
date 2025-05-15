-- Create the student table
CREATE TABLE student (
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    gender VARCHAR(10) NOT NULL
);

-- Insert records into the student table
INSERT INTO student (name, age, gender) VALUES
('Alice Johnson', 22, 'Female'),
('Michael Smith', 24, 'Male'),
('Linda Carter', 21, 'Female');
