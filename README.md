# Rhapsody gem

**Still under development**

Rhapsody gem provides a Ruby object-oriented interface for Rhapsody API.

## Installation

Add this line to your application's Gemfile:

    gem 'rhapsody'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rhapsody

## Usage

### Setting up a client

A client prepares you to make calls to Rhapsody API.
Here is an example code for setting up a client using
[implicit method](https://developer.rhapsody.com/api#authentication).

``` ruby
require 'rhapsody'

options = {
  api_key: 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
  api_secret: 'yyyyyyyyyyyy',
  auth_code: 'zzzzzzzzzz',
  redirect_url: 'http://example.com/rhapsody/auth'
}

client = Rhapsody::Client.new(options)
client.connect
```

### Running tests

Rhapsody gem uses RSpec and FactoryGirl.

1. Get the API key and API secret from
[Rhapsody Developers site](https://developer.rhapsody.com/).

2. Create a file called `config.yml` in `spec` directory.

3. Add the following with the correct API key and API secret

``` yml
config_variables:
  API_KEY: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  API_SECRET: "yyyyyyyyyyyy"
```

4. `$ bundle install`

5. `$ rspec`

## Contributing

1. Fork it ( https://github.com/[my-github-username]/rhapsody/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
