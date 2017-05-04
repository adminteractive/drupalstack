# Drupalstack
Docker based development environment for Drupal 8.

## Featuring
* Apache 2.4
* PHP 7.1
* MariaDB 5.5
* Composer based Drupal installation 
* Drush
* Drupal Console
* PHPMyAdmin
* MailHog
## Web interfaces
You can access the services running in the containers from the following (default) URL-s.
### Your Drupal site
```http://web.local:8080```
### PHPMyAdmin
```http://pma.local:8080```
### MailHog
```http://mailhog.local:8080```
## Installing Drupal
You should use Composer to install Drupal and all it's dependencies. Default dependencies, including Drupal core, are defined in ```web/composer.json``` which you can manage using ```$ docker-compose run composer <command>```. 
```bash
$ docker-compose run composer install
```
## Interacting with your installation
### Using Composer
```bash
$ docker-compose run composer <command>
```
### Using Drush
```bash
$ docker-compose run drush <command>
```
### Using Drupal Console
```bash
$ docker-compose run drupal <command>
```
### Console access to your Apache/PHP conatiner
```bash
$ docker exec -it <projectname>_web_1 bash
```
You have multiple containers running in your environment. Use ```drupal-compose ps``` to list all the containers you can connect to. 
