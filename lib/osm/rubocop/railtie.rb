# frozen_string_literal: true

module Osm
  module ::Osm::Rubocop
    class Railtie < Rails::Railtie
      rake_tasks { load 'tasks/osm_rubocop.rake' }
    end
  end
end
