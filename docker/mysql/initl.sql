CREATE USER 'agreefyUser'@'%' IDENTIFIED BY 'pass@123';
GRANT ALL PRIVILEGES ON *.* TO 'agreefyUser'@'%' WITH GRANT OPTION;
GRANT SELECT ON mysql.* TO 'agreefyUser'@'%';
FLUSH PRIVILEGES;