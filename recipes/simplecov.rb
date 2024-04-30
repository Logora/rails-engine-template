say "Installing simplecov"

# Add the gems
inject_into_file GEMSPEC_FILE, before: %r{^end$} do
  <<-CODE
  spec.add_development_dependency 'simplecov'
  CODE
end