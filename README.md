contineo
========

Hold together all your databases in a rails application with ease!

## Supports

    Rails 2.3+

## Installation

Add this line to your Rails application's `Gemfile`:

    gem 'contineo'

And then run:

    $ bundle install

## Usage

Convention here is, simply you create configuration sections in database.yml, as:
    
    <db_name_you_call_it>_<environment>
    
and you will get a connection class to this database as:

    DbNameYouCallIt
    
Sample database.yml:

    development:
      adapter: sqlite3
      database: db/development.sqlite3
      pool: 5
      timeout: 5000
    
    # Look at the convention <db_name>_<environment>
    other_development:
      adapter: sqlite3
      database: db/other_whatever_name_of_db.sqlite3
      pool: 5
      timeout: 5000
     
    # Look at the convention <db_name>_<environment>
    another_development:
      adapter: sqlite3
      database: db/another_db.sqlite3
      pool: 5
      timeout: 5000

Now Access db with ease

    # Create your model as:
    class Teacher < Other
    end
    
    class Doctor < Another
    end
    
That's it!

## Contributing

1. Fork it
2. Create your feature branch - `git checkout -b my-new-feature`
3. Commit your changes - `git commit -m 'Add some feature'`
4. Push to the branch - `git push origin my-new-feature`
5. Create new Pull Request
