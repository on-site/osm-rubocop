namespace :osm_rubocop do
  desc 'Install a pre-commit hook that ensures the code adheres to the OSM Rubocop configuration'
  task :install_precommit_hook do
    source = File.join(
      Gem.loaded_specs['osm-rubocop'].full_gem_path,
      'lib',
      'osm',
      'rubocop',
      'pre-commit.bash'
    )
    root = defined?(::Rails.root) ? ::Rails.root : Dir.pwd
    target = File.join(root, '.git', 'hooks', 'pre-commit')

    # rubocop:disable Rails/SkipsModelValidations
    # There's a false positive rubocop violation here.  See bug at:
    # https://github.com/bbatsov/rubocop/issues/4260
    FileUtils.touch target
    # rubocop:enable Rails/SkipsModelValidations
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
