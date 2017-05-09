# Osm::Rubocop

OSM default Rubocop config

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'osm-rubocop', require: false
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install osm-rubocop

## Usage

#### Using osm-rubocop's rubocop configuration

Add this line to the top of your project's .rubocop.yml:

```ruby
require: osm-rubocop
```

It will make osm-rubocop's configuration the default configuration for running rubocop.

#### Adding a pre-commit hook

If your project is a Rails application, add this to your Rakefile (above the call to `load_tasks`):

```ruby
require 'osm-rubocop'
```

If your project is not a Rails application, add this to your Rakefile:

```ruby
require 'osm-rubocop'
load File.join Gem.loaded_specs['osm-rubocop'].full_gem_path, 'lib', 'tasks', 'osm_rubocop.rake'
```

Now you can create a pre-commit hook by running:

```bash
$ rake osm_rubocop:install_precommit_hook
```

This will install a pre-commit hook that will remind you to make sure there are no rubocop violations before each commit.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/on-site/osm-rubocop.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
