## Summary

This application is for planning trips with friends. A user can post an idea for
a trip and their friends can post the dates they are available.

## Technologies Used
* Ruby 2.2.4
* CSS for styling
* PostgreSQL (database management system)
* Rails (MVC web application framework)
* ActiveRecord (object relational mapping)
* Devise for user authentification
* CanCanCan for user authorization
* CarrierWave for uploading images
* s3 for storing images
* Heroku for deployment

## Problems Encountered:

I originally intended to have responses include start and end dates rather
than including a separate availabilities model. I was still allowing users to
express availability for multiple timeframes by entering multiple responses, but
this was not very user friendly.

## Future Development:

* I would like to improve error handling. (e.g. for paths that do not exist)
* I would like to make the display of availabilities more dynamic
* I would like to improve styling (possibly using Bootstrap)
* I would like to add an option to archive events
* I would like to add a search option
* I would like to enable email notifications to track new ideas being posted by a user's friends

See [trello](https://trello.com/b/6COv0M49/escapades) for more details
