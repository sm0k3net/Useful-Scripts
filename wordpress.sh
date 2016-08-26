#!/bin/bash

#####################################################
#Script to confiruge Server, WebServer and WordPress#
#####################################################


#Colors settings
BLUE='\033[0;34m'
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color


#Welcome message
clear
echo -e "Welcome to WordPress & LAMP stack installation and configuration wizard!
First of all, we going to check all required packeges..."

#Checking packages
echo -e "${YELLOW}Checking packages...${NC}"
echo -e "List of required packeges: nano, zip, unzip, mc, htop, fail2ban, apache2 & php, mysql, php curl, phpmyadmin, wget, curl"

read -r -p "Do you want to check packeges? [y/N] " response
case $response in
    [yY][eE][sS]|[yY]) 


NANO=$(dpkg-query -W -f='${Status}' nano 2>/dev/null | grep -c "ok installed")
  if [ $(dpkg-query -W -f='${Status}' nano 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo -e "${YELLOW}Installing nano${NC}"
    apt-get install nano --yes;
    elif [ $(dpkg-query -W -f='${Status}' nano 2>/dev/null | grep -c "ok installed") -eq 1 ];
    then
      echo -e "${GREEN}nano is installed!${NC}"
  fi

ZIP=$(dpkg-query -W -f='${Status}' zip 2>/dev/null | grep -c "ok installed")
  if [ $(dpkg-query -W -f='${Status}' zip 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo -e "${YELLOW}Installing zip${NC}"
    apt-get install zip --yes;
    elif [ $(dpkg-query -W -f='${Status}' zip 2>/dev/null | grep -c "ok installed") -eq 1 ];
    then
      echo -e "${GREEN}zip is installed!${NC}"
  fi

MC=$(dpkg-query -W -f='${Status}' mc 2>/dev/null | grep -c "ok installed")
  if [ $(dpkg-query -W -f='${Status}' mc 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo -e "${YELLOW}Installing mc${NC}"
    apt-get install mc --yes;
    elif [ $(dpkg-query -W -f='${Status}' mc 2>/dev/null | grep -c "ok installed") -eq 1 ];
    then
      echo -e "${GREEN}mc is installed!${NC}"
  fi

HTOP=$(dpkg-query -W -f='${Status}' htop 2>/dev/null | grep -c "ok installed")
  if [ $(dpkg-query -W -f='${Status}' htop 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo -e "${YELLOW}Installing htop${NC}"
    apt-get install htop --yes;
    elif [ $(dpkg-query -W -f='${Status}' htop 2>/dev/null | grep -c "ok installed") -eq 1 ];
    then
      echo -e "${GREEN}htop is installed!${NC}"
  fi

FAIL2BAN=$(dpkg-query -W -f='${Status}' fail2ban 2>/dev/null | grep -c "ok installed")
  if [ $(dpkg-query -W -f='${Status}' fail2ban 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo -e "${YELLOW}Installing fail2ban${NC}"
    apt-get install fail2ban --yes;
    elif [ $(dpkg-query -W -f='${Status}' fail2ban 2>/dev/null | grep -c "ok installed") -eq 1 ];
    then
      echo -e "${GREEN}fail2ban is installed!${NC}"
  fi

APACHE2=$(dpkg-query -W -f='${Status}' apache2 2>/dev/null | grep -c "ok installed")
  if [ $(dpkg-query -W -f='${Status}' apache2 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo -e "${YELLOW}Installing apache2${NC}"
    apt-get install apache2 php5 --yes;
    elif [ $(dpkg-query -W -f='${Status}' apache2 2>/dev/null | grep -c "ok installed") -eq 1 ];
    then
      echo -e "${GREEN}apache2 is installed!${NC}"
  fi

MYSQL=$(dpkg-query -W -f='${Status}' mysql-server 2>/dev/null | grep -c "ok installed")
  if [ $(dpkg-query -W -f='${Status}' mysql-server 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo -e "${YELLOW}Installing mysql-server${NC}"
    apt-get install mysql-server --yes;
    elif [ $(dpkg-query -W -f='${Status}' mysql-server 2>/dev/null | grep -c "ok installed") -eq 1 ];
    then
      echo -e "${GREEN}mysql-server is installed!${NC}"
  fi

PHP5CURL=$(dpkg-query -W -f='${Status}' php5-curl 2>/dev/null | grep -c "ok installed")
  if [ $(dpkg-query -W -f='${Status}' php5-curl 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo -e "${YELLOW}Installing php5-curl${NC}"
    apt-get install php5-curl --yes;
    elif [ $(dpkg-query -W -f='${Status}' php5-curl 2>/dev/null | grep -c "ok installed") -eq 1 ];
    then
      echo -e "${GREEN}php5-curl is installed!${NC}"
  fi

PHPMYADMIN=$(dpkg-query -W -f='${Status}' phpmyadmin 2>/dev/null | grep -c "ok installed")
  if [ $(dpkg-query -W -f='${Status}' phpmyadmin 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo -e "${YELLOW}Installing phpmyadmin${NC}"
    apt-get install phpmyadmin --yes;
    elif [ $(dpkg-query -W -f='${Status}' phpmyadmin 2>/dev/null | grep -c "ok installed") -eq 1 ];
    then
      echo -e "${GREEN}phpmyadmin is installed!${NC}"
  fi

WGET=$(dpkg-query -W -f='${Status}' wget 2>/dev/null | grep -c "ok installed")
  if [ $(dpkg-query -W -f='${Status}' wget 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo -e "${YELLOW}Installing wget${NC}"
    apt-get install wget --yes;
    elif [ $(dpkg-query -W -f='${Status}' wget 2>/dev/null | grep -c "ok installed") -eq 1 ];
    then
      echo -e "${GREEN}wget is installed!${NC}"
  fi

CURL=$(dpkg-query -W -f='${Status}' curl 2>/dev/null | grep -c "ok installed")
  if [ $(dpkg-query -W -f='${Status}' curl 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo -e "${YELLOW}Installing curl${NC}"
    apt-get install curl --yes;
    elif [ $(dpkg-query -W -f='${Status}' curl 2>/dev/null | grep -c "ok installed") -eq 1 ];
    then
      echo -e "${GREEN}curl is installed!${NC}"
  fi

  ;;

    *)

  echo -e "${RED}
  Packeges check is ignored! 
  Please be aware, that apache2, mysql, phpmyadmin and other software may not be installed!
  ${NC}"

  ;;
esac


#phpmyadmin default path change
echo -e "${YELLOW}Changing phpMyAdmin default path from /phpMyAdmin to /myadminphp...${NC}"

read -r -p "Do you want to change default phpMyAdmin path to /myadminphp? [y/N] " response
case $response in
    [yY][eE][sS]|[yY]) 
  
cat >/etc/phpmyadmin/apache.conf <<EOL
# phpMyAdmin default Apache configuration

Alias /myadminphp /usr/share/phpmyadmin

<Directory /usr/share/phpmyadmin>
    Options FollowSymLinks
    DirectoryIndex index.php

    <IfModule mod_php5.c>
        <IfModule mod_mime.c>
            AddType application/x-httpd-php .php
        </IfModule>
        <FilesMatch ".+\.php$">
            SetHandler application/x-httpd-php
        </FilesMatch>

        php_flag magic_quotes_gpc Off
        php_flag track_vars On
        php_flag register_globals Off
        php_admin_flag allow_url_fopen Off
        php_value include_path .
        php_admin_value upload_tmp_dir /var/lib/phpmyadmin/tmp
        php_admin_value open_basedir /usr/share/phpmyadmin/:/etc/phpmyadmin/:/var/lib/phpmyadmin/:/usr/share/php/php-gettext/:/usr/share/javascript/:/usr/share/php/tcpdf/
    </IfModule>

</Directory>

# Authorize for setup
<Directory /usr/share/phpmyadmin/setup>
    <IfModule mod_authz_core.c>
        <IfModule mod_authn_file.c>
            AuthType Basic
            AuthName "phpMyAdmin Setup"
            AuthUserFile /etc/phpmyadmin/htpasswd.setup
        </IfModule>
        Require valid-user
    </IfModule>
</Directory>

# Disallow web access to directories that don't need it
<Directory /usr/share/phpmyadmin/libraries>
    Require all denied
</Directory>
<Directory /usr/share/phpmyadmin/setup/lib>
    Require all denied
</Directory>
EOL

echo -e "${GREEN}Path was succesfully changed!
New phpMyAdmin path is: /myadminphp (i.e.: yourwebsite.com/myadminphp)${NC}"

        ;;
    *)

  echo -e "${RED}Path was not changed!${NC}"

        ;;
esac

#creating user
echo -e "${YELLOW}Adding separate user & creating website home folder for secure running of your website...${NC}"

  echo -e "${YELLOW}Please, enter new username: ${NC}"
  read username
  echo -e "${YELLOW}Please enter website name: ${NC}"
  read websitename
  groupadd $username
  adduser --home /var/www/$username/$websitename --ingroup $username $username
  mkdir /var/www/$username/$websitename/www
  chown -R $username:$username /var/www/$username/$websitename
  echo -e "${GREEN}User, group and home folder were succesfully created!
  Username: $username
  Group: $username
  Home folder: /var/www/$username/$websitename
  Website folder: /var/www/$username/$websitename/www${NC}"


#configuring apache2
echo -e "${YELLOW}Now we going to configure apache2 for your domain name & website root folder...${NC}"

read -r -p "Do you want to configure Apache2 automatically? [y/N] " response
case $response in
    [yY][eE][sS]|[yY]) 

  echo -e "Please, provide us with your domain name: "
  read domain_name
  echo -e "Please, provide us with your email: "
  read domain_email
  cat >/etc/apache2/sites-available/$domain_name.conf <<EOL
  <VirtualHost *:80>
        ServerAdmin $domain_email
        ServerName $domain_name
        ServerAlias www.$domain_name
        DocumentRoot /var/www/$username/$websitename/www/
        <Directory />
                Options +FollowSymLinks
                AllowOverride All
        </Directory>
        <Directory /var/www/$username/$websitename/www>
                Options -Indexes +FollowSymLinks +MultiViews
                AllowOverride All
                Order allow,deny
                allow from all
        </Directory>

        ScriptAlias /cgi-bin/ /usr/lib/cgi-bin/
        <Directory "/usr/lib/cgi-bin">
                AllowOverride None
                Options +ExecCGI -MultiViews +SymLinksIfOwnerMatch
                Order allow,deny
                Allow from all
        </Directory>

        ErrorLog ${APACHE_LOG_DIR}/error.log

        # Possible values include: debug, info, notice, warn, error, crit,
        # alert, emerg.
        LogLevel warn

        CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOL
	a2dissite 000-default
    a2ensite $domain_name
    service apache2 restart
    P_IP="`wget http://ipinfo.io/ip -qO -`"

    echo -e "${GREEN}Apache2 config was updated!
    New config file was created: /etc/apache2/sites-available/$domain_name.conf
    Domain was set to: $domain_name
    Admin email was set to: $domain_email
    Root folder was set to: /var/www/$username/$websitename/www
    Option Indexes was set to: -Indexes (to close directory listing)
    Your server public IP is: $P_IP (Please, set this IP into your domain name 'A' record)
    Website was activated & apache2 service reloaded!
    ${NC}"

        ;;
    *)

  echo -e "${RED}WARNING! Apache2 was not configured properly, you can do this manually or re run our script.${NC}"

        ;;
esac

#downloading WordPress, unpacking, adding basic pack of plugins, creating .htaccess with optimal & secure configuration
echo -e "${YELLOW}On this step we going to download latest version of WordPress with EN or RUS language, set optimal & secure configuration and add basic set of plugins...${NC}"

read -r -p "Do you want to install WordPress & automatically set optimal and secure configuration with basic set of plugins? [y/N] " response
case $response in
    [yY][eE][sS]|[yY]) 

  echo -e "${GREEN}Please, choose WordPress language you need (set RUS or ENG): "
  read wordpress_lang

  if [ "$wordpress_lang" == 'RUS' ];
    then
    wget https://ru.wordpress.org/latest-ru_RU.zip -O /tmp/$wordpress_lang.zip
  else
    wget https://wordpress.org/latest.zip -O /tmp/$wordpress_lang.zip
  fi

  echo -e "Unpacking WordPress into website home directory..."
  sleep 5
  unzip /tmp/$wordpress_lang.zip -d /var/www/$username/$websitename/www/
  mv /var/www/$username/$websitename/www/wordpress/* /var/www/$username/$websitename/www
  rm -rf /var/www/$username/$websitename/www/wordpress
  rm /tmp/$wordpress_lang.zip
  mkdir /var/www/$username/$websitename/www/wp-content/uploads
  chmod -R 777 /var/www/$username/$websitename/www/wp-content/uploads

  echo -e "Now we going to download some useful plugins:
  1. Google XML Sitemap generator
  2. Social Networks Auto Poster
  3. Add to Any
  4. Easy Watermark"
  sleep 7
  
  SITEMAP="`curl https://wordpress.org/plugins/google-sitemap-generator/ | grep https://downloads.wordpress.org/plugin/google-sitemap-generator.*.*.*.zip | awk '{print $3}' | sed -ne 's/.*\(http[^"]*.zip\).*/\1/p'`"
  wget $SITEMAP -O /tmp/sitemap.zip
  unzip /tmp/sitemap.zip -d /tmp/sitemap
  mv /tmp/sitemap/* /var/www/$username/$websitename/www/wp-content/plugins/

  wget https://downloads.wordpress.org/plugin/social-networks-auto-poster-facebook-twitter-g.zip -O /tmp/snap.zip
  unzip /tmp/snap.zip -d /tmp/snap
  mv /tmp/snap/* /var/www/$username/$websitename/www/wp-content/plugins/

  ADDTOANY="`curl https://wordpress.org/plugins/add-to-any/ | grep https://downloads.wordpress.org/plugin/add-to-any.*.*.zip | awk '{print $3}' | sed -ne 's/.*\(http[^"]*.zip\).*/\1/p'`"
  wget $ADDTOANY -O /tmp/addtoany.zip
  unzip /tmp/addtoany.zip -d /tmp/addtoany
  mv /tmp/addtoany/* /var/www/$username/$websitename/www/wp-content/plugins/

  WATERMARK="`curl https://wordpress.org/plugins/easy-watermark/ | grep https://downloads.wordpress.org/plugin/easy-watermark.*.*.*.zip | awk '{print $3}' | sed -ne 's/.*\(http[^"]*.zip\).*/\1/p'`"
  wget $WATERMARK -O /tmp/watermark.zip
  unzip /tmp/watermark.zip -d /tmp/watermark
  mv /tmp/watermark/* /var/www/$username/$websitename/www/wp-content/plugins/

  rm /tmp/sitemap.zip /tmp/snap.zip /tmp/addtoany.zip /tmp/watermark.zip
  rm -rf /tmp/sitemap/ /tmp/snap/ /tmp/addtoany/ /tmp/watermark/


  echo -e "Downloading of plugins finished! All plugins were transfered into /wp-content/plugins directory.${NC}"

        ;;
    *)

  echo -e "${RED}WordPress and plugins were not downloaded & installed. You can do this manually or re run this script.${NC}"

        ;;
esac

#creating of swap
echo -e "On next step we going to create SWAP (it should be your RAM x2)..."

read -r -p "Do you need SWAP? [y/N] " response
case $response in
    [yY][eE][sS]|[yY]) 

  RAM="`free -m | grep Mem | awk '{print $2}'`"
  swap_allowed=$(($RAM * 2))
  swap=$swap_allowed"M"
  fallocate -l $swap /var/swap.img
  chmod 600 /var/swap.img
  mkswap /var/swap.img
  swapon /var/swap.img

  echo -e "${GREEN}RAM detected: $RAM
  Swap was created: $swap${NC}"
  sleep 5

        ;;
    *)

  echo -e "${RED}You didn't create any swap for faster system working. You can do this manually or re run this script.${NC}"

        ;;
esac

#creation of secure .htaccess
echo -e "${YELLOW}Creation of secure .htaccess file...${NC}"
sleep 3
cat >/var/www/$username/$websitename/www/.htaccess <<EOL
<IfModule mod_rewrite.c>
RewriteEngine On
RewriteBase /
RewriteRule ^index\.php$ - [L]
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule . /index.php [L]

RewriteCond %{query_string} concat.*\( [NC,OR]
RewriteCond %{query_string} union.*select.*\( [NC,OR]
RewriteCond %{query_string} union.*all.*select [NC]
RewriteRule ^(.*)$ index.php [F,L]

RewriteCond %{QUERY_STRING} base64_encode[^(]*\([^)]*\) [OR]
RewriteCond %{QUERY_STRING} (<|%3C)([^s]*s)+cript.*(>|%3E) [NC,OR]
</IfModule>

<Files .htaccess>
Order Allow,Deny
Deny from all
</Files>

<Files wp-config.php>
Order Allow,Deny
Deny from all
</Files>

<Files wp-config-sample.php>
Order Allow,Deny
Deny from all
</Files>

<Files readme.html>
Order Allow,Deny
Deny from all
</Files>

<Files xmlrpc.php>
Order allow,deny
Deny from all
</files>

# Gzip
<ifModule mod_deflate.c>
AddOutputFilterByType DEFLATE text/text text/html text/plain text/xml text/css application/x-javascript application/javascript text/javascript
</ifModule>

Options +FollowSymLinks -Indexes

EOL

chmod 644 /var/www/$username/$websitename/www/.htaccess

echo -e "${GREEN}.htaccess file was succesfully created!${NC}"

#cration of robots.txt
echo -e "${YELLOW}Creation of robots.txt file...${NC}"
sleep 3
cat >/var/www/$username/$websitename/www/robots.txt <<EOL
User-agent: *
Disallow: /cgi-bin
Disallow: /wp-admin/
Disallow: /wp-includes/
Disallow: /wp-content/
Disallow: /wp-content/plugins/
Disallow: /wp-content/themes/
Disallow: /trackback
Disallow: */trackback
Disallow: */*/trackback
Disallow: */*/feed/*/
Disallow: */feed
Disallow: /*?*
Disallow: /tag
Disallow: /?author=*
EOL

echo -e "${GREEN}File robots.txt was succesfully created!
Setting correct rights on user's home directory and 755 rights on robots.txt${NC}"
sleep 3

chmod 755 /var/www/$username/$websitename/www/robots.txt

echo -e "${GREEN}Configuring fail2ban...${NC}"
sleep 3
cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.conf-old
cat >/etc/fail2ban/jail.conf <<EOL
[DEFAULT]

ignoreip = 127.0.0.1/8
ignorecommand =
bantime  = 1200
findtime = 1200
maxretry = 3
backend = auto
usedns = warn
destemail = $domain_email
sendername = Fail2Ban
sender = fail2ban@localhost
banaction = iptables-multiport
mta = sendmail

# Default protocol
protocol = tcp
# Specify chain where jumps would need to be added in iptables-* actions
chain = INPUT
# ban & send an e-mail with whois report to the destemail.
action_mw = %(banaction)s[name=%(__name__)s, port="%(port)s", protocol="%(protocol)s", chain="%(chain)s"]
              %(mta)s-whois[name=%(__name__)s, dest="%(destemail)s", protocol="%(protocol)s", chain="%(chain)s", sendername="%(sendername)s"]
action = %(action_mw)s

[ssh]
enabled  = true
port     = ssh
filter   = sshd
logpath  = /var/log/auth.log
maxretry = 5

[ssh-ddos]
enabled  = true
port     = ssh
filter   = sshd-ddos
logpath  = /var/log/auth.log
maxretry = 5

[apache-overflows]
enabled  = true
port     = http,https
filter   = apache-overflows
logpath  = /var/log/apache*/*error.log
maxretry = 5
EOL

service fail2ban restart

echo -e "${GREEN}fail2ban configuration finished!
fail2ban service was restarted, default confige backuped at /etc/fail2ban/jail.conf-old
Jails were set for: ssh bruteforce, ssh ddos, apache overflows${NC}"

sleep 5

echo -e "${GREEN} Configuring apache2 prefork & worker modules...${NC}"
sleep 3
cat >/etc/apache2/mods-available/mpm_prefork.conf <<EOL
<IfModule mpm_prefork_module>
	StartServers			 1
	MinSpareServers		  1
	MaxSpareServers		 3
	MaxRequestWorkers	  10
	MaxConnectionsPerChild   3000
</IfModule>
EOL

cat > /etc/apache2/mods-available/mpm_worker.conf <<EOL
<IfModule mpm_worker_module>
	StartServers			 1
	MinSpareThreads		 5
	MaxSpareThreads		 15
	ThreadLimit			 25
	ThreadsPerChild		 5
	MaxRequestWorkers	  25
	MaxConnectionsPerChild   200
</IfModule>
EOL

a2dismod status

echo -e "${GREEN}Configuration of apache mods was succesfully finished!
Restarting Apache & MySQL services...${NC}"

service apache2 restart
service mysql restart

echo -e "${GREEN}Services succesfully restarted!${NC}"
sleep 3

echo -e "${GREEN}Adding user & database for WordPress, setting wp-config.php...${NC}"
echo -e "Please, set username for database: "
read db_user
echo -e "Please, set password for database user: "
read db_pass

mysql -u root -p <<EOF
CREATE USER '$db_user'@'localhost' IDENTIFIED BY '$db_pass';
CREATE DATABASE IF NOT EXISTS $db_user;
GRANT ALL PRIVILEGES ON $db_user.* TO '$db_user'@'localhost';
ALTER DATABASE $db_user CHARACTER SET utf8 COLLATE utf8_general_ci;
EOF

cat >/var/www/$username/$websitename/www/wp-config.php <<EOL
<?php

define('DB_NAME', '$db_user');

define('DB_USER', '$db_user');

define('DB_PASSWORD', '$db_pass');

define('DB_HOST', 'localhost');

define('DB_CHARSET', 'utf8');

define('DB_COLLATE', '');

define('AUTH_KEY',         '$db_user');
define('SECURE_AUTH_KEY',  '$db_user');
define('LOGGED_IN_KEY',    '$db_user');
define('NONCE_KEY',        '$db_user');
define('AUTH_SALT',        '$db_user');
define('SECURE_AUTH_SALT', '$db_user');
define('LOGGED_IN_SALT',   '$db_user');
define('NONCE_SALT',       '$db_user');

\$table_prefix  = 'wp_';

define('WP_DEBUG', false);

if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

require_once(ABSPATH . 'wp-settings.php');
EOL

chown -R $username:$username /var/www/$username
echo -e "${GREEN}Database user, database and wp-config.php were succesfully created & configured!${NC}"
sleep 3
echo -e "Installation & configuration succesfully finished.
Twitter: @sm0k3net
e-mail: info@sm0k3.net
Bye!"
