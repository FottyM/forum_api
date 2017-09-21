[![Build Status](https://travis-ci.com/FottyM/forum_api.svg?token=ezxbwzx4yzRF7YSKWEAV&branch=master)](https://travis-ci.com/FottyM/forum_api) [![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/mdp/rotp/blob/master/LICENSE)

### Live demo
Live demo on => [heroku](https://tikvaa-forum-api.herokuapp.com/)

## Getting Started
+ Clone the application with `git clone https://github.com/FottyM/forum_api.git` or use ssh  `git clone git@github.com:FottyM/forum_api.git`.

## Dependencies

* Ruby version 2.2.1 and above
* Rails 4.0.0
* PostgreSQL

### Downloading PostgreSQL
Run these commands from terminal:

`sudo apt-get -y update`

`sudo apt-get -y install postgresql postgresql-contrib`

Once you have postgresql installed, create a superuser for postgresql
`adduser <username>`
`passwd <password>`
after which you can type in
`su - postgres`

on macOs with homebrew `brew install postgresql` or download the postgresql client for mac
Once you have all the dependencies, you can then run your command line and navigate into the project's folder and then run:

* Run `bundle install` to install all other dependencies

Alternatively you can run our automated script by doing the following

* Give the script execution permissions by running `chmod +x install.sh`
* Run `./install.sh` to install all other dependencies

    ***Note*** some gems might cause issues while installing, so for unix/linux users try `sudo gem install <gem_name>`
* Run `rails db:setup` to set up the db, run the migrattions and seed the db all at once. or,
* Run `rails db:migrate` or `rake db:migrate` and then,
* Run `rails db:seed`  or `rake db:seed`.

(*the `rake` command was used for rails version prior rails 5. But it is no logner required*)

## Running The Server

You can then run `rails s` or `rails server` and visit the page on the browser by typing `localhost:3000`. (*you can add the flag `-p <port_number>` to specify a different port number, e.i. `rails s -p 8000`*)

## Running The Specs
After all the setting up as mentioned above, you can run the tests. The tests are driven by rspec, capybara and selenium. You can get them fired up by running the following command from the terminal.

  `rspec spec`

or

  `bundle exec rspec`

## Application Main Features

* Write a question and explanations
* Answer to questions
* Delete questions/answers if you're the owner or if you've the admin right
* Register with username and password
* log in/log out
* authenticate with jwt