# Cluckr

Cluckr is a Twitter clone that we'll be building during [Rails Testing Accelerator](https://www.codewithjason.com/rails-testing-accelerator/).

## How to get set up locally

Note: Cluckr uses PostgreSQL, so you'll need to have PostgreSQL installed in order to get the project running.

```
$ git clone git@github.com:jasonswett/cluckr-2020a.git cluckr
$ cd cluckr
$ bundle install
$ yarn
$ rails db:create
$ rails db:schema:load
````

## Running the server

```
$ rails s -p3030
```
