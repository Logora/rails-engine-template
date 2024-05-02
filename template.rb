
GEMSPEC_FILE = File.join(destination_root, "#{name}.gemspec")
GEMFILE_PATH = File.join(destination_root, "Gemfile")
RECIPE_PATH = File.join(File.dirname(rails_template), "recipes")
FILES_PATH = File.join(File.dirname(rails_template), "files")
RECIPES = %w[gemspec rspec simplecov rswag]

def add_template_to_source_path
    source_paths.unshift(File.dirname(__FILE__))
end

add_template_to_source_path

gsub_file GEMFILE_PATH, /gem \"sqlite3\"/, "gem 'sqlite3', '~> 1.4'"

RECIPES.each do |recipe|
  apply File.join(RECIPE_PATH, "#{recipe}.rb")
end

