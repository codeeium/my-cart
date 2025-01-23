**1. Prerequisites**

- **Ubuntu Server** (18.04 or later recommended)
- **SSH Client** (like PuTTY)
- **Root or sudo access** to your server

**2. Update and Upgrade**

```bash
sudo apt update
sudo apt upgrade -y
```

**3. Install Web Server (Nginx)**

```bash
sudo apt install nginx
```

**4. Install PHP and Required Extensions**

```bash
sudo apt install php php-fpm php-mysql php-gd php-curl php-mbstring php-zip php-intl
```

**5. Install Database (MariaDB)**

```bash
sudo apt install mariadb-server
```

**6. Secure MariaDB**

- Run the MariaDB security script:
  ```bash
  sudo mysql_secure_installation
  ```
- Follow the on-screen instructions to set a root password, remove anonymous users, and disable remote root login.

**7. Create OpenCart Database and User**

1.  Log in to MariaDB:
    ```bash
    sudo mysql -u root -p
    ```
2.  Create a database:
    ```sql
``    CREATE DATABASE opencart;
    ```
3.  Create a user:
    ```sql
 ``   CREATE USER 'opencart_user'@'localhost' IDENTIFIED BY 'your_strong_password';
    ```
4.  Grant privileges to the user:
    ```sql
  ``  GRANT ALL PRIVILEGES ON opencart.* TO 'opencart_user'@'localhost';
    ```
5.  Flush privileges:
    ```sql
 ``   FLUSH PRIVILEGES;
    ```
6.  Exit MariaDB:
    ```sql
  ``  EXIT;
    ```

**8. Download OpenCart**

- Download the latest OpenCart release from the official website: [https://www.opencart.com/](https://www.google.com/url?sa=E&source=gmail&q=https://www.opencart.com/)
- Extract the downloaded archive to your desired location (e.g., `/var/www/html/opencart`):
  ```bash
  sudo unzip opencart.zip -d /var/www/html/opencart
  ```

**9. Configure Nginx Virtual Host**

- Create a new Nginx server block file:

  ```bash
  sudo nano /etc/nginx/sites-available/opencart
  ```

- Paste the following configuration, replacing placeholders with your actual values:

  ```nginx
  server {
      listen 80;
      server_name your_domain.com; # Replace with your domain name
      root /var/www/html/opencart/public; # Adjust path if needed

      index index.php;

      location / {
          try_files $uri $uri/ /index.php?$args;
      }

      location ~ \.php$ {
          fastcgi_pass unix:/var/run/php/php7.4-fpm.sock; # Adjust path if needed
          fastcgi_index index.php;
          include fastcgi_params;
          fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
      }
  }
  ```

- Create a symbolic link to enable the site:

  ```bash
  sudo ln -s /etc/nginx/sites-available/opencart /etc/nginx/sites-enabled/
  ```

**10. Test Nginx Configuration**

- Check for syntax errors:
  ```bash
  sudo nginx -t
  ```
- Restart Nginx:
  ```bash
  sudo systemctl restart nginx
  ```

**11. Access OpenCart Installation**

- Open your web browser and navigate to `http://your_domain.com` (replace with your actual domain).
- Follow the on-screen instructions to complete the OpenCart installation.

**12. Final Steps**

- Change the default OpenCart admin password.
- Remove the installation directory (`/var/www/html/opencart/install`).
- Configure additional settings like caching and extensions as needed.

**Note:**

- This guide assumes you're using Nginx as your web server. If you're using Apache, you'll need to adjust the configuration accordingly.
- Always back up your files and database before making any major changes.
- Refer to the official OpenCart documentation for the latest and most accurate installation instructions: [https://docs.opencart.com/](https://www.google.com/url?sa=E&source=gmail&q=https://docs.opencart.com/)

