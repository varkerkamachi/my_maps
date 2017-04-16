# README


# my_maps
This application is a demo app to play with integrating MapBox api in a Rails app. 

## Setup
- Ruby version 2.3.0
- Rails version 5.1.0.rc1
* clone repository to your local
* cd into my_maps directory
* `bundle install`
* `rake db:create`
* `rake db:migrate`
* `rails s`

You should be prompted to login from the initial screen, and if you don't have an account created, go through the signup process instead.


## Test Suite
To run the tests, cd to the project folder and run either
* `bundle exec rake spec`
* `rspec spec/`

### To-dos
* Refactor js into SPA, using React or other framework
* Build more robust interactivity on map layer using more of the Mapbox API
* UX/UI cleanup and improvement
