# frozen_string_literal: true

require 'osm/rubocop/version'
require 'osm/rubocop/railtie' if defined?(::Rails::Railtie)
require 'rubocop'

module Osm
  module Rubocop
    CONFIG_FILE = File.join(
      Gem.loaded_specs['osm-rubocop'].full_gem_path,
      'config',
      'default.yml'
    ).freeze

    def self.inject_defaults!
      ::RuboCop::ConfigLoader.default_configuration =
        ::RuboCop::ConfigLoader.configuration_from_file(CONFIG_FILE)
    end
  end
end
