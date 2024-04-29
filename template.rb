
# spec and linter related
gem_group :test do
    gem 'rspec-rails'
    gem 'shoulda-matchers'
    gem 'database_cleaner-active_record'
end

gem_group :development, :test do
    gem 'factory_bot_rails'
    gem "simplecov", require: false
    gem 'rswag-specs'
    gem 'faker'
end

# Edit gemspec metadata
say "Remove TODO from gemspec..."
GEMSPEC_FILE = File.join(destination_root, "#{name}.gemspec")

gsub_file GEMSPEC_FILE, /authors\s+= \[\"TODO.+\"\]/, 'authors    = ["Authors"]'
gsub_file GEMSPEC_FILE, /email\s+= \[\"TODO.+\"\]/, 'email    = ["author@example.com"]'
gsub_file GEMSPEC_FILE, /homepage\s+= \"TODO\"/, 'homepage    = "http://example.com"'
gsub_file GEMSPEC_FILE, /summary\s+= \"TODO.+\"/, 'summary     = "Summary"'
gsub_file GEMSPEC_FILE, /description\s+= \"TODO.+\"/, 'description = "Description"'

gsub_file GEMSPEC_FILE, /spec\.metadata\[\"allowed_push_host\"\]\s+= \"TODO.+\"/, ''
gsub_file GEMSPEC_FILE, /\[\"source_code_uri\"\]\s+= \"TODO.+\"/, '["source_code_uri"]     = spec.homepage'
gsub_file GEMSPEC_FILE, /spec\.metadata\[\"changelog_uri\"\]\s+= \"TODO.+\"/, ''

inside('.') do
    # Setup RSpec and test related config
    run "rspec:install"

    # Set up the spec folders for RSpec
    run "mkdir spec/models"
    run "mkdir spec/controllers"
    run "mkdir spec/views"
    run "mkdir spec/jobs"
    run "mkdir spec/helpers"
    run "mkdir spec/mailers"

    # New folder for factories
    run "mkdir spec/factories"
end