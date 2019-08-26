# NFLApi

This is a Ruby gem wrapper for NFL.com's API (the WADL for which you can read [here](http://www.nfl.com/feeds-rs?_wadl)).  Not all endpoints have been implement (because there's an impressive number of them).

Contributions are welcome.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nfl_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nfl_api

## Usage

```ruby
require 'nfl_api'

NFLApi::Team.all  # Array of teams
NFLApi::Team.by_season(2018) # Array of teams from 2018
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pcg79/nfl_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the NflApi project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/pcg79/nfl_api/blob/master/CODE_OF_CONDUCT.md).
