# test/test_helper.rb
require 'simplecov'
require 'coveralls'
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
])
SimpleCov.start
require 'minitest/autorun'
require 'minitest/unit'
require 'minitest/pride'
require 'httparty'
require 'samba_api/init'
require 'samba_api/projects'
require 'samba_api/categories'
require 'samba_api/medias'
require 'faker'
require 'yaml'
require 'samba_api'

SimpleCov.command_name 'Unit Tests'