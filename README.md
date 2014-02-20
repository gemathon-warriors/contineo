contineo
========

connect multiple databases to your rails application with ease!

=== sample database.yml:

    development:
      adapter: sqlite3
      database: db/development.sqlite3
      pool: 5
      timeout: 5000

    other_development:
      adapter: sqlite3
      database: db/other.sqlite3
      pool: 5
      timeout: 5000

=== Access with ease

Create your model as:

    class Part < Other
      contineo
    end


