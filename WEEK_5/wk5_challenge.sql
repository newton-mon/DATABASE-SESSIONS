CREATE TABLE student (
    name VARCHAR(100) NOT NULL,    -- Name column with a maximum of 100 characters
    age INT NOT NULL,              -- Age column as an integer
    gender VARCHAR(10) NOT NULL    -- Gender column with a maximum of 10 characters
);


-- create an indx

CREATE INDEX IdxAge ON student(age);
