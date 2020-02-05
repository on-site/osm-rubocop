# frozen_string_literal: true

namespace :osm_rubocop do
  desc 'Install a pre-commit hook that ensures the code adheres to the OSM Rubocop configuration'
  # rubocop:disable Rails/RakeEnvironment (installing the pre-commit hook does not require loading a rails environment)
  task :install_precommit_hook do
    # rubocop:enable Rails/RakeEnvironment
    source = File.join(
      Gem.loaded_specs['osm-rubocop'].full_gem_path,
      'lib',
      'osm',
      'rubocop',
      'pre-commit.bash'
    )
    root = defined?(::Rails.root) ? ::Rails.root : Dir.pwd
    target = File.join(root, '.git', 'hooks', 'pre-commit')

    FileUtils.touch target
    FileUtils.chmod '+x', target

    source_content = File.read source
    target_content = File.read target

    unless target_content.include? source_content
      File.open(target, 'a') do |f|
        f.puts source_content
      end
    end
  end
end
