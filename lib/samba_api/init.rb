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
    #TODO Refactor the module name in namespace
    def namespace
      SambaApi.demodulize_class(self.class.ancestors[1])
    end

    def base_url
      SambaApi::BASE_URL
    end

    def category_base_url
      SambaApi::CATEGORY_BASE_URL
    end

    def access_token
      "?access_token=#{@access_token}"
    end

    def header_request
      {"Content-Type" => "application/json"}
    end
  end
end
