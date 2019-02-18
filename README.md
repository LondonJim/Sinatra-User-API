# User API in Sinatra

Using ActiveRecord ORM, BCrypt, PostgreSQL (and eventually JWTs) to create a user API

* work in progress


## Installation

`git clone git@github.com:LondonJim/Sinatra-User-API.git`

`bundle`

`rackup` go to `localhost:9292`

## Database setup

PostgreSQL is used for the database setup. A database named chitter and a chitter_test are used with peeps and users tables. These will need to be setup on your local machine currently. In `psql` enter the following commands:

Database creation for development and production:

CREATE DATABASE "user"

CREATE DATABASE "user_test"


### Instructions:
----
Sign up a new user

`POST` `/users/signup`

example body:
```
{
    "name": "user name"
    "email": "user@example.com",
    "password": "test"
}
```
note: passwords are stored encrypted using bcrypt

----

Log in a user

`POST` `/users/login`

example body:
```
{
    "name": "user name"
    "email": "user@example.com",
    "password": "test"
}
```

----

Delete a user (email and password of matching id)

`Delete` `/users/delete/:id`

example body(must match user id of user to delete):
```
{
    "name": "user name"
    "email": "user@example.com",
    "password": "test"
}
```

----