[![Coverage Status](https://coveralls.io/repos/github/chiligumdev/samba_api/badge.svg?branch=master)](https://coveralls.io/github/chiligumdev/samba_api?branch=master)

# SambaApi

Simple lib to manipulate the sambatech API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'samba_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install samba_api

## Usage

 To start using gem is very simple. Instantiate the class by passing its access_token created in the sambatech panel. Let's take a look at the example:

```ruby
 client = SambaApi::Init.new(access_token: 'my_valid_token_created_in_sambatech_dashboard')

```

 After this step, we can start using all the features offered by the sambaTech API


## Projects

 To manipulate the project endpoint, we have four methods to support us.


#### List all existing projects

  After instantiating your client with a valid access_token, call the following method:

```ruby

  projects = client.all_projects

```
  
  This method will return an array of hashes containing all the projects belonging to the previously installed client.

#### Search for a specific project

```ruby

  some_project = client.project(project_id)

```
  This method returns the project informed according to the id if the project exists

#### Creating a project

  To create a project, call the create_project method by passing the project name and its description as mandatory parameters. Let's take a look at the example:

```ruby
  
  new_project = client.create_project(name_of_project, description_of_project)

```

#### Deleting a project
  
  To delete a project, just call the delete_project method, passing the id of the project you want to delete as the required parameter.

```ruby

  response_project = client.delete_project(project_id)
  
```

## Medias

 To manipulate medias endpoint, we have the following methods to support us.

### Listing all medias from a project

 To list all the videos created in a project, simply call the following method by passing the project_id parameter. The project id is required.

```ruby

  medias = client.all_medias(project_id)

```

 This method will return an array of hashes containing all the videos belonging to the project informed in the parameter passed.

#### Search for a specific Media

```ruby
  
  some_media = client.get_media(media_id, project_id)
  
```

 This method returns the media informed according to the media_id and the project_id if the project and media exists.

#### Creating a Media

   To create a media, call the upload_media method by passing the media_path and project_id as mandatory parameters. Let's take a look at the example:

```ruby

   new_media = client.upload_media('/some/path/to/my/media.mp4', project_id)

```

#### Deleting a media
 
  To delete medias just call delete_media method passing the id of the project where the media belong and the id of the media, this parameters are mandatories

```ruby

  response_media = client.delete_media(media_id, project_id)


```

#### Activing media


 To activate a media, it is necessary to pass the id of the media to be activated the id of the project that the media belongs to and a body in json format with the information to be updated.

 Possible values in body: { id , title , status , qualifier , description , shortDescription , categoryName , categoryId , postdate , lastModified , publishDate , published , highlighted , restricted , secondUrl , numberOfViews , numberOfComments , numberOfRatings , childStatus , tags , files , thumbs , genders , captions , externalPublishings }

```ruby

 body = { "publishDate": DateTime.now, "categoryId": "12345" }

 response_media = client.active_media(media_id, project_id, body)

```

 If all information in the body is correct, the media must be updated

## Categories
 
 To manipulate categories endpoint, we have the following methods to support us.


#### Listing all categories from a project
 
 To list all categories created in a project, simply call the following method by passing the project_id parameter. The project id is required. 

```ruby

  categories = client.all_categories(project_id)

```

 This method will return an array of hashes containing all the categories belonging to the project informed in the parameter passed.

#### Search for a specific Category

```ruby

   some_category = client.category(category_id, project_id)

```

  This method returns the category informed according to the category_id and the project_id if the project and category exists.

#### Creating a Category

 To create a category, call the create_category method by passing the project_id  and pass a hash with the options listed in API as mandatory parameters. Let's take a look at the example:



```ruby

body = '{
  "name": "Automobilismo",
  "parent": 19240,
  "genre": null,
  "connectedAccounts": [],
  "children": []
}'

  new_category = client.create_category(project_id, body)


```


#### Deleting a Category

To delete categories just call delete_category method passing the id of the project where the category belongs and the id of the category, this parameters are mandatories


```ruby

  response_category = client.delete_category(category_id, project_id)


```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/chiligumdev/samba_api.
