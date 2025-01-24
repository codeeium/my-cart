------
rootroot password
mysql -u root -p

ALTER USER 'root'@'localhost' IDENTIFIED BY 'new_password';
FLUSH PRIVILEGES;

GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;

----------------------------
sudo apt update
sudo apt install mysql-server -y
sudo systemctl start mysql
sudo systemctl enable mysql
sudo mysql_secure_installation

Set a root password.
Remove anonymous users.
Disallow root login remotely.
Remove test databases.

sudo mysql -u root -p
CREATE USER 'new_user'@'localhost' IDENTIFIED BY 'user_password';
GRANT ALL PRIVILEGES ON *.* TO 'new_user'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;

sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf
Find bind-address = 127.0.0.1 and change it to bind-address = 0.0.0.0.
sudo systemctl restart mysql

