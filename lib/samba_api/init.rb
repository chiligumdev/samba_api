require 'samba_api'
require 'samba_api/projects'
require 'samba_api/categories'
require 'samba_api/medias'

# samba_api/ĺib/samba_api/init.rb
module SambaApi
  # class init access
  class Init
    include HTTParty
    include SambaApi::Projects
    include SambaApi::Categories
    include SambaApi::Medias

    def initialize(options={})
      options.each do |key, value|
        instance_variable_set("@#{key}", value)
        yield(self) if block_given?
      end
    end
    private 

    def base_url
      SambaApi::BASE_URL
    end

    def category_base_url
      SambaApi::CATEGORY_BASE_URL
    end

    def media_base_url
      SambaApi::MEDIA_BASE_URL
    end

    def access_token
      "?access_token=#{@access_token}"
    end

    def header_request
      {"Content-Type" => "application/json"}
    end
  end
end
