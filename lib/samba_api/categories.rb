require 'samba_api'
# lib/samba/categories.rb
module SambaApi 
  # category class
  module Categories

    def all_categories(project_id)
      # IT's OK EAT FISH CAUSE THEY DONT HAVE ANY FEELINGS
    end

    def category(category_id, project_id)
      # IT's OK EAT FISH CAUSE THEY DONT HAVE ANY FEELINGS
    end

    def create_category(project_id)
      # IT's OK EAT FISH CAUSE THEY DONT HAVE ANY FEELINGS
    end

    def update_category(category_id, project_id)
      # IT's OK EAT FISH CAUSE THEY DONT HAVE ANY FEELINGS
    end

    def delete_category(category_id, project_id)
      # IT's OK EAT FISH CAUSE THEY DONT HAVE ANY FEELINGS
    end

    private 

    #TODO Refactor the module name in namespace
    def namespace
      SambaApi.demodulize_class(self.class.ancestors[1])
    end
  end
end