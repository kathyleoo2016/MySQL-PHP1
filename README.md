# MySQL-PHP1

2017-05-07
# Setup local host for Apache, MySQL, phpmyadmin on Mac 
- Reference video: https://www.youtube.com/watch?v=o2Qt1H4duYw (Missing one step in the phpmyadmin installation ))
- Note: $ does not need to key in $ in the terminal

# 1. Start Apache 
$ sudo apachectl start
- go -> computer Macintosh/Library/WebServer/Documents/ -> get info-> unlock -> change to read write: so that you can put the files into this folder to run on the localhost)
  
$ sudo nano /etc/apache2/httpd.conf     
- find #load module php5... -> remove # -> ctrl o -> enter ->ctrl x)

- Restart the server
$ sudo apachectl restart

- Continue configuration to make index.php in priority
$ sudo nano /etc/apache2/httpd.conf  
- find the DirectoryIndex under Directory -> put index.php in front of index.html -> ctrl o -> enter ->ctrl x


- Restart the server again
$ sudo apachectl restart

- Show the index.php in the local host
$ sudo nano /Library/WebServer/Documents/index.php

# 2. MySQL:
- Download MySQL and install it ->  save the password somewhere else -> then in the terminal:
$ sudo mkdir /var/mysql

$ sudo ln -s /tmp/mysql.sock/var/mysql/mysql.sock

- In Preference -> MySQL -> Start Mysql Server

# Activate MySQL server: 
$ cd /usr/local/mysql/bin
$ sudo ./mysql -u root -p

- Will see it changes to mysql> in the terminal

- Change the Mysql password (only be useful for the first time use)
$ Alter user 'root'@'localhost' identified by 'newpassword';


# 3. phpmyadmin
- Download and unzip the file -> rename the folder to phpmyadmin -> put it into the folder: go -> computer ->WebServer>Documents

- In the terminal:
$ cd /Library/WebServer/Documents
$ cd phpmyadmin
$ sudo mkdir config
$ sudo chmod o+x config

- in the webbrowser, type in: localhost/phpmyadmin/setup
- New Server
- In the configuration tab, type in the password for Mysql -> apply -> download -> put the downloaded file into go -> computer Macintosh/Library/WebServer/Documents/phpmyadmin
- Open the file, change 
$cfg['Servers'][$i]['host'] = '127.0.0.1';

- In the web browser, type in: localhost/phpmyadmin/ -> then you can log in the phpmyadmin
