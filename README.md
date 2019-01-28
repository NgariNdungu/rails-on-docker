# How to: 
1. clone this repository
2. `cd` into created directory
3. run `docker-compose build`
4. create directories that will be mounted into the container:
  ~~~
  mkdir -p tmp/bundle
  mkdir database
  ~~~
5. create a new rails app in the directory with:
  ~~~
  docker-compose run --no-deps app rails new . -d postgresql -B
  ~~~
6. Edit `config/environments/development.rb` and change the file watcher:
  ~~~ ruby
  # config.file_watcher = ActiveSupport::EventedFileUpdateChecker
  config.file_watcher = ActiveSupport::FileUpdateChecker
  ~~~
7. Edit `config/database.yml` and set up the host and username:
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
8. Start the app with `docker-compose up`
9. Generate the databases with 'docker-compose exec app bundle exec rails db:create'
10. Nagivate to http://localhost on your browser. You should see the rails welcome page.
