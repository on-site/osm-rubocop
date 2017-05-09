module Osm
  module Rubocop
    class Railtie < Rails::Railtie
      rake_tasks { load 'tasks/osm_rubocop.rake' }
    end
  end
end
