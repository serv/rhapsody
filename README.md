# Rhapsody

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'rhapsody'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rhapsody

## Usage

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


## Contributing

1. Fork it ( https://github.com/[my-github-username]/rhapsody/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
