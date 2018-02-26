require 'bundler'
Bundler.require

require File.expand_path('../config/environment',  __FILE__)
require File.expand_path('../app/app',  __FILE__)

run App
