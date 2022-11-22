# Planter :seedling:
A planner for plants. Exploring the Ruby on Rails framework via online learning with [Plural Sight's Ruby on Rails: The Big Picture](https://app.pluralsight.com/library/courses/ruby-rails-big-picture/table-of-contents).

:railway_car: [Quick link to Rails docs.](https://api.rubyonrails.org)

## Using this App
### Versions Used:
- ruby 2.7.2p137
- Rails 6.1.7

### Terminal Commands:
- :point_right: ```rails server```
  - Start local server and display request logs
- ```rails routes | grep [keyword]```
  - View Routes by keyword
- ```rails new <application_name>```
  - Create application and install dependencies
- ```rails generate scaffold <name> <attribute>```
  - Create a full model-to-views prototype
- ```rails db:migrate```
  - Run any pending database migrations
- ``rails help``
  - Find more rails commands
## Overview on Rails
### Rails Conventions
- :file_folder: A place for every file and every file in its place.
- :recycle: Migration files for repeatable database alterations.
- :lock: CSRF, XSS and SQL injection protection, security headers, SSL, encrypted secrets.
- :arrow_forward: Code autoloading and reloading in development.
- :white_check_mark: Automatically generated tests with all files.
- :clock1: Localization and timezone support out of the box.

### Rails is a Metaframework
#### Rails Request Cycle 
```
        Request 
            ↓ 
        Router
            ↓
Model ↔ Controller ↔ View
            ↓
        Reponse
```

#### :books: Active Record (MODEL)
- An ORM; it maps the state of data in a Ruby object to its stored representation in your database.
- `Person.first.update(email:”example”)` = `UPDATE people SET email = “example” WHERE people.id =1;`
- Rails uses `:symbols` instead of `“strings”` because they’re memory efficient by default.
- `|block arguments|`
- Database migration is the process of migrating data from one or more source databases to one or more target databases by using a database migration service.


#### :eyes: Action View (VIEW)
- Instance variables are available to the view (specific to Rails) (`@people`)
- What is an instance, technically?
  - Instantiated.
  - An instance variable is a variable defined in a class
- Params only allows what is expected. A security mearue.
- Templates
  - ERB (embedded Ruby) syntax; define view templates.
  - `<%= [ruby code here] %>`
  - The Asset Pipeline combines and compresses your CSS assets into a single file.

#### :vertical_traffic_light: Action Pack (CONTROLLER)
- Defining routes to direct HTTP requests
- Controllers retrieve data from models
- Generates URL route helpers and other methods to simplify handling logic.

#### JavaScript
- :yarn: Yarn
  - Like npm, installing dependencies.
  - `@rails/webpacker`
    - Webpack is a JavaScript module bundler which in theory makes it easier to reference a lot of JavaScript code from different places.
- `app>javascript>packs>application.js`
  - `Rails.start() ` enables Rails Unobtrusive JavaScript.
    - Rails UJS is a set of lightweight JavaScript tools that allow Rails to use client-side functionality using data attributes.
    - `Turbolinks.start()`
      - HTML of show page, replaced body, update URL.
      - Speeds up browser rendering by only updating HTML that actually changes.
      Defaults to turbolinks but you can use React or whatever you want.
## Using Rails
### :bricks: Scaffolding
```rails generate scaffold person email name```
- new migration for the people table
- person model
- people controller
- views for CRUD actions
- CSS stylesheets

```rails generate scaffold plant name person:references```

Looking in ``db>migrate>create_plants.rb``, we can see t.references which takes the ``:person`` symbol and two options:
- ``null: false``.
    - means we require all plants to always have a reference to a person.
- ``foreign_key:true``
    - meaning we can't have a person that doesn't also exist on the person table.

### Associations
- Collection proxies in Active Record are middlemen between an `association`, and its `target` result set. An array-like structure that contains many model instances.