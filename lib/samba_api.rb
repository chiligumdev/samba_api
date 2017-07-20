require 'httparty'
require 'json'
require 'byebug'
require 'samba_api/version'
require 'samba_api/samba'
require 'samba_api/projects'

# lib/samba_api.rb
module SambaApi

  class << self
    def demodulize_class class_name
      class_name.to_s.split('::').last.downcase
    end
  end
end
