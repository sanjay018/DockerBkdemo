-- Create the database
CREATE DATABASE IF NOT EXISTS agreefy_tag;
-- Use the database
USE agreefy_tag;

-- Create a table and insert some data
CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL
);

INSERT INTO users (name, email) VALUES
  ('John Doe', 'john@example.com'),
  ('Jane Smith', 'jane@example.com');

