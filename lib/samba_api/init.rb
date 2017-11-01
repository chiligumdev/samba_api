require 'samba_api'
require 'samba_api/projects'
require 'samba_api/categories'

# samba_api/ĺib/samba_api/init.rb
module SambaApi
  # class init access
  class Init
    include HTTParty
    include SambaApi::Projects

    def initialize(options={})
      options.each do |key, value|
        instance_variable_set("@#{key}", value)
        yield(self) if block_given?
      end
    end
  end
end
