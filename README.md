# Planter :seedling:
A planner for plants. Exploring the Ruby on Rails framework via online learning with [Plural Sight's Ruby on Rails: The Big Picture](https://app.pluralsight.com/library/courses/ruby-rails-big-picture/table-of-contents).

:railway_car: [Quick link to Rails docs.](https://guides.rubyonrails.org/v3.2/getting_started.html)

---
## Using this App
### Versions Used:
- ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [arm64-darwin21]
- Rails 6.1.7

### Terminal Commands:
- Boot the server by running: ```rails server```
- Visit address (http://127.0.0.1:3000/ in my case)
- Run pending migrations if needed
---
## Overview on Rails
### Rails Conventions
- A place for every file and every file in its place.
- Migration files for repeatable database alterations.
- CSRF, XSS and SQL injection protection, security headers, SSL, encrypted secrets.
- Code autoloading and reloading in development.
- Automatically generated tests with all files.
- Localization and timezone support out of the box.

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

#### Active Record (MODEL)
- An ORM; it maps the state of data in a Ruby object to its stored representation in your database.
- `Person.first.update(email:”example”)` = `UPDATE people SET email = “example” WHERE people.id =1;`
- Rails uses `:symbols` instead of `“strings”` because they’re memory efficient by default.
- `|block arguments|`
- Database migration is the process of migrating data from one or more source databases to one or more target databases by using a database migration service.


#### Action View (VIEW)
- Instance variables are available to the view (specific to Rails) (`@people`)
- What is an instance, technically?
  - Instantiated.
  - An instance variable is a variable defined in a class
- Params only allows what is expected. A security mearue.
- Templates
  - ERB (embedded Ruby) syntax; define view templates.
  - `<%= [ruby code here] %>`
  - The Asset Pipeline combines and compresses your CSS assets into a single file.

#### Action Pack (CONTROLLER)
- Defining routes to direct HTTP requests
- Controllers retrieve data from models
- Generates URL route helpers and other methods to simplify handling logic.

#### JavaScript
- Yarn
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
---

### Scaffolding
```rails generate scaffold person email name```
- new migration for the people table
- person model
- people controller
- views for CRUD actions
- CSS stylesheets

```rails generate scaffold plant name person:references```

Looking in ``db>migrate>create_plants.rb``, we can see t.references which takes the ``:person`` symbol and two options -- ``null: false, foreign_key:true``.