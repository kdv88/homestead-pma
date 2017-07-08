#!/bin/bash

sudo apt-get -qq update
sudo apt-get -qq -y install unzip

echo 'Downloading latest phpMyAdmin'
curl -s -#L https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-english.tar.gz -o phpmyadmin.tar.gz

mkdir phpmyadmin && tar xf phpmyadmin.tar.gz -C phpmyadmin --strip-components 1

rm phpmyadmin.tar.gz

cat << 'EOL' >> phpmyadmin/config.inc.php
<?php
$i = 1;
$cfg['Servers'][$i]['auth_type'] = 'config';
$cfg['Servers'][$i]['user'] = 'homestead';
$cfg['Servers'][$i]['password'] = 'secret';

$cfg['ThemeDefault']= 'metro';
EOL

echo 'Installing phpMyAdmin theme'
wget --quiet https://files.phpmyadmin.net/themes/metro/2.5/metro-2.5.zip -O temp.zip; unzip -q temp.zip

mv metro phpmyadmin/themes
rm temp.zip


CERT_CMD=/vagrant/vendor/laravel/homestead/scripts/create-certificate.sh
SERVE_CMD=/vagrant/vendor/laravel/homestead/scripts/serve-laravel.sh
if [ ! -f $CMD ]; then
    echo "Older version detected."
    # fallback for older versions
    CMD=/vagrant/scripts/serve.sh
fi

echo "Creating certificate"
sudo bash $CERT_CMD phpmyadmin.app
echo "Serving new phpmyadmin.app"
sudo bash $SERVE_CMD phpmyadmin.app $(pwd)/phpmyadmin

sudo systemctl restart nginx.service
