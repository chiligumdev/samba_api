# test/test_helper.rb
require 'simplecov'
SimpleCov.start
require 'coveralls'
Coveralls.wear!
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