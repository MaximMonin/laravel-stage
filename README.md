# laravel-stage for staging laravel application
This package is continuation of the project of laravel development and testing project https://github.com/MaximMonin/laravel-docker
It uses this same enviroment, but has project's autobuild and autotesting capabilities with gitlab-runner.

Project was build with a goal to auto create stage enviroment, test and rebuild stage server on every commit to any development repositories.
Also create production builds if testing is successful.

## Installation
1. Clone this project   
2. Copy env-docker file to .env and change default values to your site   
3. Register new project on gitlab.   
4. Start containers.   

Docker compose works with combination of nginx-proxy https://github.com/MaximMonin/nginx-ssh-proxy-docker, or as local installation
To create nginx-proxy network run sudo docker network create nginx-proxy


## Setup

1. /mail catalog consists ssmtp mail configuration files.   
2. Register your project on gitlab or setup your own private gitlab server.   
https://github.com/MaximMonin/gitlab-docker as example   
   
3. Register your own gitlab-runner. Run 'gitlab-runner register' inside laravel-stage container. 
runner/conf/config.toml file will be changed.
Check in 'Run untagged jobs' in runner properties to allow gitlab see available runner.   

4. Change .gitlab-ci.yml file to setup CI/CD jobs.
By default this file runs scripts in runner/scripts directory and runs laravel phpunit tests and Laravel Dusk tests.   

beforebuild.sh script loads projects files from development git repo and saves files in /git directory.
Change it to your laravel development project.   
build.sh copies project's files to /app directory + copy .env file to setup laravel enviroment.   
After copy build.sh creates/updates mysql database and then compile java scripts with webpack.   

On deploy stage it extracts laravel application from container and creates production build.tar.gz   

5. Register pipeline trigger for your gitlab project and follow instruction to create webhooks 
from source development projects.    
It allows for every push to development git repos start whole CI/CD process and rebuild stage image and run tests   
https://gitlab.com/api/v4/projects/projectid/ref/master/trigger/pipeline?token=copiedtoken   

6. Change /runner/scripts/ build-name build-version to your project name and version.   
Edit files to exclude from build.tar.gz in /runner/scripts/build-exclude file.   

By default port 2390 used for local site testing and 2391 for mysql administration. (root/root)   

## More
Create Production image and enviroment with https://github.com/MaximMonin/laravel-prod project    
