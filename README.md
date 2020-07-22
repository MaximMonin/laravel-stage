# laravel-stage for staging laravel application
This package is continuation of the project of laravel development and testing project https://github.com/MaximMonin/laravel-docker
It uses this same enviroment, but has project's autobuild capabilities and project's gitlab-runner autotesting

## Installation
~~~
1. Clone this project
2. Copy env-docker file to .env and change default values to your site
3. Start containers.

Docker compose works with combination of nginx-proxy https://github.com/MaximMonin/nginx-ssh-proxy-docker, or as local installation
To create nginx-proxy network run sudo docker network create nginx-proxy
~~~

## Setup
~~~
1. /mail catalog consists ssmtp mail configuration files.
2. Register your project on gitlab or setup your own private gitlab server.
https://github.com/MaximMonin/gitlab-docker as example
Register your own gitlab-runner. Run gitlab-runner register inside laravel-stage container. It changes runner/conf/config.toml file
Check in 'Run untagged jobs' in runner properties
3. Change .gitlab-ci.yml file to setup CI/CD jobs.
By default this file runs scripts in runner/scripts directory.
By default beforebuild.sh script loads projects files from development git repo and saves files in /git directory
build.sh copy projects files to /app directory + copy .env file to setup laravel enviroment
After copy build.sh migrate mysql database and then compile java scripts with webpack

By default port 2390 used for local site testing and 2391 for mysql administration. (root/root)
~~~

