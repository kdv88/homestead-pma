## About

Simple shell script that automatically installs the latest version of PhpMyAdmin
on a Laravel Homestead box.

Based on the work of  [grrnikos](https://github.com/grrnikos/pma), but with some added features:

* Homestead 5.4 support (creation of certificate)
* Install the latest version of phpMyAdmin
* Install the Metro theme (I don't like the default)
* Auto-login phpMyAdmin (be careful running this on public networks)

## Usage

1. SSH into your Homestead box `homestead ssh` or `vagrant ssh`

2. `$ curl -sS https://raw.githubusercontent.com/kdv88/homestead-pma/master/pma.sh | bash`

3. Open the `/etc/hosts` file on your main machine and add `127.0.0.1  phpmyadmin.app`

4. Go to [http://phpmyadmin.app:8000](http://phpmyadmin.app:8000).

You can also add the contents of pma.sh to the after.sh of your project so
you don't have to ssh into your vagrant box.

## License

The MIT License (MIT). Please see [License File](LICENSE.md) for more information.
