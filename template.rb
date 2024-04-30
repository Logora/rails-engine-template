
GEMSPEC_FILE = File.join(destination_root, "#{name}.gemspec")
RECIPE_PATH = File.join(File.dirname(rails_template), "recipes")
FILES_PATH = File.join(File.dirname(rails_template), "files")
RECIPES = %w[gemspec rspec simplecov rswag]

def add_template_to_source_path
    source_paths.unshift(File.dirname(__FILE__))
end

add_template_to_source_path

RECIPES.each do |recipe|
  apply File.join(RECIPE_PATH, "#{recipe}.rb")
end

