say "Installing rspec, factory_bot, shoulda_matchers"

# Add test files
inject_into_file GEMSPEC_FILE, after: /spec\.files.*$/ do
  %(\n  spec.test_files = Dir["spec/**/*"])
end

# Add the gems
inject_into_file GEMSPEC_FILE, before: %r{^end$} do
  <<-CODE
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'factory_bot_rails'
  spec.add_development_dependency 'faker'
  spec.add_development_dependency 'shoulda-matchers'
  CODE
end

# Setting default Rake task to :spec
append_to_file "Rakefile" do
  %{
  APP_RAKEFILE = File.expand_path("../spec/dummy/Rakefile", __FILE__)
  load 'rails/tasks/engine.rake'

  desc "Run all specs in spec directory (excluding plugin specs)"
  RSpec::Core::RakeTask.new(:spec => 'app:db:test:prepare')
  task :default => :spec
  }.strip
end

# Setting rspec and factory_bot as default generators...
insert_into_file "lib/#{name.split("-").join("/")}/engine.rb", after: /isolate_namespace .*$/ do
  %(
      config.generators do |g|
        g.test_framework :rspec, fixtures: true
        g.fixture_replacement :factory_bot, dir: 'spec/factories'
      end
  )
end

template File.join(FILES_PATH, "spec_helper.rb"), "spec/spec_helper.rb", force: true
template File.join(FILES_PATH, "rails_helper.rb"), "spec/rails_helper.rb", force: true
