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

**NB! This quickstart guide assumes that you already have your host machine set 
up accordingly to work with Docker and other tools.**

1. Clone this Git repository.

    ```bash
    $ git clone https://github.com/picco/drupalstack.git my-project
    ```

2. Start your project services.

    ```bash
    $ my-project/bin/start-services.sh
    ```

3. Install Drupal 8.

    ```bash
    $ my-project/bin/install-project.sh
    ```

4. Access your project via your preferred web browser.
    
    ```bash
    $ my-project/bin/show-links.sh
    ```

## Helper scripts

Directory `bin` contains many helper scripts for frequent operations that you 
definitely want to use to control your project in various ways. It is 
encourage to contribute more such scripts to improve the overall workflow when 
working with a Drupal project.

* Build project services.

  Increased the PHP memory limit? Enabled some random module for Apache? 
Rebuild your project services easily with this helper script.

    ```bash
    $ my-project/bin/build-services.sh
    ```

* Export project database dump.

  Quickly create a database dump and export it to your project root directory. 

    ```bash
    $ my-project/bin/export-database-dump.sh
    ```

* Install system-wide Portainer service.

    ```bash
    $ my-project/bin/install-portainer.sh
    ```
 
* Install Drupal 8.

  Kickstart your Drupal 8 project with the help of this script. Read more about
it from here <https://github.com/drupal-composer/drupal-project> if you want to 
know what exactly happens after you have executed this script.

    ```bash
    $ my-project/bin/install-project.sh
    ```
     
* Remove project files.

  Need to remove your project files and start over from scratch? Use this 
script to delete all your files.

  **NB! Be cautious, because there is no way to restore them if you haven't 
added your project files to Git for example.**

    ```bash
    $ my-project/bin/remove-files.sh
    ```
     
* Remove system-wide Portainer service.

    ```bash
    $ my-project/bin/remove-portainer.sh
    ```
     
* Restart project services.

  Enables you to quickly restart all of your project services.

    ```bash
    $ my-project/bin/restart-services.sh
    ```
     
* Enter httpd service.

    ```bash
    $ my-project/bin/shell-into-httpd.sh
    ```
     
* Enter MySQL service.

  Drush or PhpMyAdmin aren't providing everything you need to interact with your 
project databases? Enter you MySQL service by using this script and start 
hacking SQL directly from the CLI.

    ```bash
    $ my-project/bin/shell-into-mysql.sh
    ```
     
* Enter PHP service.

  Need to use PHP from the command line or execute Drush or Drupal Compose 
against your Drupal project? Use this script to quickly enter your PHP service.

    ```bash
    $ my-project/bin/shell-into-php.sh
    ```
     
* Show project services logs.

  You have a problem with your project or some service just stopped running? 
Use this script to see all your project services logs for easy debugging.

    ```bash
    $ my-project/bin/show-logs.sh
    ```
     
* Show project services ports.

  Lists your project services exposed ports to access them easily if you have 
multiple projects running on your machine at the same time.

    ```bash
    $ my-project/bin/show-ports.sh
    ```
     
* Show project links.

  Don't like to search for Apache ports from Docker Compose process list each 
time you use it? Use this script to get only the relevant URL-s that you can 
paste directly to your web browser address bar to have a quick access to your 
project.

    ```bash
    $ my-project/bin/show-links.sh
    ```
     
* Build and run project services.

  Need to start your project services but don't exactly remember how to do it 
with Docker Compose? Simply run this script from your project directory and it 
will start your project services for you.

    ```bash
    $ my-project/bin/start-services.sh
    ```

## What is `.env` file used for?

The `.env` file is used to store environment specific configuration to control 
your project services behaviour (e.g. Blackfire server credentials) without 
needing to rebuild your project services. Each time you make changes to this 
file you must also restart your project services. If you don't have `.env` file 
in your project root directory already then simply take the `.env.sample` file 
as a basis for your `.env` file as follows:

```bash
$ cp my-project/.env.sample my-project/.env
```

To see what else you can use this file for visit the page 
<https://docs.docker.com/compose/env-file/> for more information.

**NB! You should never add this file to Git.**

## How to change the PHP memory limit or any other php.ini directives?

1. Open `my-project/services/php/src/usr/local/etc/php/php.ini` file in your 
preferred text editor.
2. Make changes to existing directives or add new ones.
3. Rebuild your project services.

    ```bash
    $ my-project/bin/build-services.sh
    ```

4. Restart your porject services.

    ```bash
    $ my-project/bin/restart-services.sh
    ```

## How to use Drush, Drupal Console, Composer or any other command depending on PHP to interact with your project?

Since your PHP service actually runs inside an isolated environment you can't 
interact with it in the conventional way. So to use Drush etc. you must first 
shell into your running PHP service and execute your desired command from 
there. For example to execute a Drush command against your Drupal project, 
simply follow these instructions:

1. Enter your project PHP service.

    ```bash
    $ my-project/bin/shell-into-php.sh
    ```

2. Change directory to Drupal root directory.

    ```bash
    $ cd /usr/local/apache2/htdocs/web
    ```

3. Execute your Drush command.

    ```bash
    $ drush status
    ```

**NB! Those same instructions are valid for all other commands as well.**

## How to use Blackfire to profile your website?

To use Blackfire PHP extension to profile your site, simply visit 
<https://blackfire.io/account> page and copy you personal server credentials 
`Server ID` and `Server Token` to the `.env` file. In that file initialize 
the variables `BLACKFIRE_SERVER_ID` and `BLACKFIRE_SERVER_TOKEN` accordingly. 
After that restart your porject services.

Once you have you environment properly integrated with the Blackfire service, 
read more from here <https://blackfire.io/docs/introduction> about how to start 
using it in practice.

## Configuring the host machine

The only dependencies for your host machine are Docker and Docker Compose.
Follow the set-up instructions on 
<https://docs.docker.com/engine/installation/linux/ubuntu/> 
and <https://docs.docker.com/compose/install/> to configure your host.

## Contribute

1. Fork this project.
2. Make changes to your project repository.
3. Create a pull request.
4. Wait for the changes to be merged.

**NB! This will change in the future.**

## Where it all started

[Using Docker to boost your development experience with Drupal](https://github.com/dockerizedrupal/drupalcamp-baltics-2015)

## License

**MIT**
