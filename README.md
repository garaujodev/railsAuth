# README

Simple API Autentication with authentication and access policies

## Ruby version

- Using docker-image with Ruby 2.3.3 and Sails 5

## System dependencies

- Docker
- Docker-compose

## Configuration

- Update your database environment in `config/database.yml` file
- Run `docker-compose build`

## Database creation

- Run `docker-compose run app bash rake db:create`
- Run `docker-compose run app bash rake db:migrate`

## How to run the test suite

- Run `docker-compose run app bash rspec`

## Deployment instructions

- Run `docker-compose up`

## How to test endpoints

- Import [this](https://www.getpostman.com/collections/76b66f660df03bee62c7) collection in postman
- Make a POST Request in _auth/signup_ with your credentials
- Get response headers `access-token`, `token-type`, `client`, `expiry` and `uid`
- Insert them in their respective postman environment variables. eg: `{{access-token}}`
