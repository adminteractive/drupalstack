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
* Xdebug support
## Configuring the host machine
The only dependencies for your host machine are Docker and Docker Compose. Follow the set-up instructions on  https://docs.docker.com/engine/installation/linux/ubuntu/ and https://docs.docker.com/compose/install/ to configure your host.
## Setting up your environment

## Accessing your services
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
## Interacting with your Docker environment
You need to run the following commands in your project root folder (where your docker-compose.yml is located).
### Start the environment
```bash
$ docker-compose up -d
```
You can also start the environment without the ```-d``` if you'd like to get all log messages to your STDOUT.
### Stop the environment
```bash
$ docker-compose down
```
### Check the status of the environment
```bash
$ docker-compose ps
```
Note: It's expected, that the composer, drupal and drush containers are in exited state.
### Use Composer
```bash
$ docker-compose run composer <command>
```
### Use Drush
```bash
$ docker-compose run drush <command>
```
### Use Drupal Console
```bash
$ docker-compose run drupal <command>
```
### Get console access to your Apache/PHP conatiner
```bash
$ docker exec -it <projectname>_web_1 bash
```
You have multiple containers running in your environment. Use ```drupal-compose ps``` to list all the containers you can connect to. 
