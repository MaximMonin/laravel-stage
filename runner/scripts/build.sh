#!/bin/bash

# Copy git images to /app
sudo rsync -qrv --exclude=.git /git/laravel/* /app
sudo rsync -qrv --exclude=.git /git/laravel-add/* /app
sudo cp /git/laravel-add/.env /app/.env

cd /app

# Database mirgation (create tables if not exists)

echo 'Database migration'
sudo php artisan migrate

# webpack build

echo 'Webpack build...'
sudo npm run dev
