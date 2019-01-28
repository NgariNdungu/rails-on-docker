# How to: 
1. clone this repository
2. `cd` into created directory
3. run `docker-compose build`
4. create a new rails app in the directory with:
  ~~~
  docker-compose run --no-deps app rails new . -d postgresql 
  ~~~
5. Edit `config/database.yml` and set up the host and username:
  ~~~ yml
  ...
  default: &default
    adapter: postgresql
    encoding: unicode
    # For details on connection pooling, see Rails configuration guide
    # http://guides.rubyonrails.org/configuring.html#database-pooling
    pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
    host: db
    username: postgres
  ...
  ~~~
6. Generate the databases with  `docker-compose run app bundle exec rails db:create`
7. Start the app with `docker-compose up`
8. Nagivate to http://localhost on your browser. You should see the rails welcome page.
