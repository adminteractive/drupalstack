# Drupalstack

Docker based development environment for Drupal 8 using only official Docker images.

## Featuring

* Apache 2.4
* PHP 7.1
* MySQL 5.7
* Composer
* Drush
* Drupal Console
* PhPMyAdmin
* MailHog
* Xdebug support
* Blackfire integration
* HTTP2 support

## Quickstart guide

To quickly get start working on your next Drupal 8 project simply follow this 
quickstart guide.

NB! This quickstart guide assumes that you already have your host machine set 
up accordingly to work with Docker and other tools.

1. Clone this project

    ```bash
    $ git clone https://github.com/picco/drupalstack.git my-project
    ```

2. Go to project directory

    ```bash
    $ cd my-project
    ```

3. Start project services

    ```bash
    $ ./bin/start-services.sh
    ```

4. Install Drupal 8

    ```bash
    $ ./bin/install-project.sh
    ```

5. Access project via web browser
    
    ```bash
    $ ./bin/show-url.sh
    ```

## Helper scripts

Directory `bin` contains many helper scripts for frequent operations that you 
definitely want to use to control your project in various ways. It is 
encourage to contribute more such scripts to improve the overall workflow when 
working with a Drupal project.

* Build project services

  Increased the PHP memory limit? Enabled some random module for Apache? 
Rebuild your services Docker images easily with this helper script.

    ```bash
    $ ./bin/build-services.sh
    ```

* Export project database dump

  Quickly create a database dump and export it to your project root directory. 

    ```bash
    $ ./bin/export-database-dump.sh
    ```

* Install system-wide Portainer service

    ```bash
    $ ./bin/install-portainer.sh
    ```
 
* Install Drupal 8

  Kickstart your Drupal 8 project with the help of this script. Read more about
it from here https://github.com/drupal-composer/drupal-project if you want to 
know what exactly happens after you have executed this script.

    ```bash
    $ ./bin/install-project.sh
    ```
     
* Remove project files

  Need to remove your project files and start over from scratch? Use this 
script to delete all your files. Be cautious, because there is no way to 
restore them if you haven't added your project files to Git for example.

    ```bash
    $ ./bin/remove-files.sh
    ```
     
* Remove system-wide Portainer service

    ```bash
    $ ./bin/remove-portainer.sh
    ```
     
* Restart project services

  Enables you to quickly restart all of your project services.

    ```bash
    $ ./bin/restart-services.sh
    ```
     
* Enter httpd service

    ```bash
    $ ./bin/shell-into-httpd.sh
    ```
     
* Enter MySQL service

  Drush or PhpMyAdmin aren't providing everything you need to interact with your 
project databases? Enter you MySQL service by using this script and start 
hacking SQL directly from the CLI.

    ```bash
    $ ./bin/shell-into-mysql.sh
    ```
     
* Enter PHP service

  Need to use PHP from the command line or execute Drush or Drupal Compose 
against your Drupal project? Use this script to quickly enter your PHP service.

    ```bash
    $ ./bin/shell-into-php.sh
    ```
     
* Show project services logs

  You have a problem with your project or some service just stopped running? 
Use this script to see all your project services logs for easy debugging.

    ```bash
    $ ./bin/show-logs.sh
    ```
     
* Show project services ports

  Lists your project services exposed ports to access them easily if you have 
multiple projects running on your machine at the same time.

    ```bash
    $ ./bin/show-ports.sh
    ```
     
* Show project URL-s

  Don't like to search for Apache ports from Docker Compose process list each 
time you use it? Use this script to get only the relevant URL-s that you can 
paste directly to your web browser address bar to have a quick access to your 
project.

    ```bash
    $ ./bin/show-url.sh
    ```
     
* Build and run project services

  Need to start your project services but don't exactly remember how to do it 
with Docker Compose? Simply run this script from your project directory and it 
will start your project services for you.

    ```bash
    $ ./bin/start-services.sh
    ```

## Configuring the host machine

The only dependencies for your host machine are Docker and Docker Compose.
Follow the set-up instructions on https://docs.docker.com/engine/installation/linux/ubuntu/ 
and https://docs.docker.com/compose/install/ to configure your host.

## License

**MIT**
