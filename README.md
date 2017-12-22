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


### Projects

 To manipulate the project endpoint, we have four methods to support us.


#### List all existing projects

  After instantiating your client with a valid access_token, call the following method:

```ruby

  client.all_projects

```



## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/chiligumdev/samba_api.

