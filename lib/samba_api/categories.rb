require 'samba_api'
# lib/samba/categories.rb
module SambaApi 
  # category class
  module Categories

    def all_categories(project_id)
      endpoint_url = base_url + 'categories' + access_token + '&pid=' + project_id.to_s
      response = self.class.get(endpoint_url)
      JSON.parse(response.body)
    end

    def category(category_id, project_id)
      endpoint_url = category_base_url + category_id.to_s + access_token + '&pid=' + project_id.to_s
      response = self.class.get(endpoint_url)
      JSON.parse(response.body)
    end

    def create_category(project_id, options = {})
      endpoint_url = category_base_url + access_token + '&pid=' + project_id.to_s
      body = { 'name' => options[:name], 'parent' => options[:parent], 'genre' => options[:genre], 'connectedAccounts' => options[:connectedAccounts], 'children' => options[:children]}.to_json
      response = self.class.post(endpoint_url, body: body, headers: header_request)
      JSON.parse response.body, symbolize_names: true
    end

    def update_category(category_id, project_id, options = {})
      endpoint_url = category_base_url + category_id.to_s + access_token + '&pid=' + project_id.to_s
      body = { 'name' => options[:name], 'id' => options[:id], 'parent' => options[:parent], 'genre' => options[:genre], 'connectedAccounts' => options[:connectedAccounts], 'children' => options[:children], hidden: options[:hidden]}.to_json
      response = self.class.put(endpoint_url, body: body, headers: header_request)
      JSON.parse response.body, symbolize_names: true
    end

    def delete_category(category_id, project_id)
      endpoint_url = category_base_url + category_id.to_s + access_token + '&pid=' + project_id.to_s
      response = self.class.delete(endpoint_url, header_request)
      JSON.parse(response.body)
    end

  end
end
