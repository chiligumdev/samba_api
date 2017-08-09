# samba_api/ĺib/samba_api/init.rb
module SambaApi
  # class init access
  class Init
    def initialize(options = {})
      options.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
      yield if block_given?
    end
  end
end
