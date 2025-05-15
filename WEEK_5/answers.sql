
-- Question 1: Write an SQL query to drop an index named IdxPhone from customers table.
-- This query removes the specified index from the 'customers' table in MySQL.
ALTER TABLE customers
DROP INDEX IdxPhone;


-- Question 2: Write an SQL query to create a user named bob with the password 'S$cu3r3!' , restricted to the localhost hostname.
-- This creates a new MySQL user 'bob' who can only connect from 'localhost' and sets their password.
CREATE USER 'bob'@'localhost' IDENTIFIED BY 'S$cu3r3!';

-- Question 3: Write an SQL query to grant the INSERT privilege to the user bob on the salesDB database.
-- This grants the 'bob'@'localhost' user the ability to insert rows into
-- any table within the 'salesDB' database.
GRANT INSERT ON salesDB.* TO 'bob'@'localhost';

-- Question 4: Write an SQL query to change the password for the user bob to 'P$55!23'.
-- This updates the password for the existing MySQL user 'bob'@'localhost'.
ALTER USER 'bob'@'localhost' IDENTIFIED BY 'P$55!23';

