# Megaplan

Megaplan API on Rails

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'megaplan'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install megaplan

## Usage

Megaplan gem models has similar to Megaplan API names, attributes, methods. All API routes is available. If you want to find deal with Id=1, you should pass such a query {"Id" => 1}. This gem is just a shell without any relations between models.     
    
    require 'megaplan'
    client = Megaplan::Api.new(endpoint: YOUR_ENDPOINT, login: YOUR_EMAIL, password: YOUR_PASSWORD)
    query = { "Id" => 1 }
    
    Megaplan::Contractor.list(client, query)
    Megaplan::Deal.list(client, query)
    
    Megaplan::Contractor.save(client, query)
    Megaplan::Deal.save(client, query)
    
    Megaplan::Contractor.delete(client, query)
    Megaplan::Deal.delete(client, query)
    
    Megaplan::Deal.find(client, query)
    
You can check some of the calls at https://help.megaplan.ru/API    

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nononoy/megaplan. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

