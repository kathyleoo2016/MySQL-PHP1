# MySQL-PHP1

2017-05-07
Setup local host for Apache, MySQL, phpmyadmin on Mac (reference video: https://www.youtube.com/watch?v=o2Qt1H4duYw)
Note: $ does not need to key in $ in the terminal

# 1. Start Apache 
$ sudo apachectl start
  (go -> computer Macintosh/Library/WebServer/Documents/ -> get info-> unlock -> change to read write: so that you can put the files into this folder to run on the localhost)
  
$ sudo nano /etc/apache2/httpd.conf     
  ( find #load module php5 -> remove # -> ctrl o -> enter ->ctrl x)
  
$ sudo apachectl restart

# 2. MySQL:
- download MySQL and install it, then in the terminal:
$ sudo mkdir /var/mysql

$ sudo ln -s /tmp/mysql.sock/var/mysql/mysql.sock

# Activate MySQL server: 
$ cd /usr/local/mysql/bin
$ sudo ./mysql -u root -p

- change the Mysql password (only be useful for the first time use)
$ Alter user 'root'@'localhost' identified by 'newpassword';


# 3. phpmyadmin
- download and unzip the file -> rename the folder to phpmyadmin -> put it into the folder: go -> computer ->WebServer>Documents

- in the webbrowser, type in: localhost/phpmyadmin/setup
- in the configuration tab, type in the password for Mysql -> apply -> download -> put the downloaded file into go -> computer Macintosh/Library/WebServer/Documents/phpmyadmin
- open the file, change 
$cfg['Servers'][$i]['host'] = '127.0.0.1';
