#!/bin/bash

# run script before build stage

# Set right to catalags
sudo chmod -R a+rw /app/storage /home/gitlab-runner

# Delete Laravel Blade views cache
sudo rm -R -f /app/storage/framework/views/*.php

echo 'Loading git images...'
cd /git

# Load project src files to stage image. Change to your git project.
sudo rm -r -f laravel
#sudo git clone https://github.com/MaximMonin/laravel.git

# Load project Laravel .env file and some other files to stage image
# sudo rm -r -f laravel-add
# sudo git clone https://user:password@git.private.site/user/laravel-add.git
