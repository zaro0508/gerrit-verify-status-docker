create database reviewdb;
create database cidb;
GRANT ALL ON *.* to 'gerrit'@'localhost' IDENTIFIED BY 'secret';
GRANT ALL ON reviewdb.* to 'gerrit'@'%' IDENTIFIED BY 'secret'; 
GRANT ALL ON cidb.* to 'gerrit'@'%' IDENTIFIED BY 'secret'; 
FLUSH PRIVILEGES;

