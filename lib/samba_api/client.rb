require 'samba_api'

# samba_api/lib/samba_api/client.rb
module SambaApi
  # initialize class client
  class Client
    def initialize(options={})
      options.each do |key, value|
        instance_variable_set("@#{key}", value)
        yield(self) if block_given?
      end
    end
  end
end
