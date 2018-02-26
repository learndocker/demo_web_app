require 'sinatra/activerecord'
require 'erb'

ENV['RACK_ENV'] ||= 'development'
APP_ROOT = File.expand_path("../app", __dir__)

Dir.glob(File.join(APP_ROOT, 'models', '*.rb')).each { |file| require file }

class App < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  set :root, APP_ROOT
  set :raise_errors, true
  set :show_exceptions, true
  set :bind, '0.0.0.0'

  set :database, {
    adapter: 'postgresql',
    encoding: 'unicode',
    pool: 2,
    database: "web_app_db_#{environment}",
    host: ENV['POSTGRES_HOST'],
    username: ENV['POSTGRES_USER'],
    password: ENV['POSTGRES_PASSWORD'],
  }
end
