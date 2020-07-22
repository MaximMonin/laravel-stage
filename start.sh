#!/bin/bash

# Before testing download latest Laravel kernel image
docker pull maximmonin/laravel:latest
docker-compose up -d
