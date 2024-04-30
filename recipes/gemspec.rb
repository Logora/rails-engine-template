# Edit gemspec metadata
say "Remove TODO from gemspec..."

gsub_file GEMSPEC_FILE, /authors\s+= \[\"TODO.+\"\]/, 'authors    = ["Authors"]'
gsub_file GEMSPEC_FILE, /email\s+= \[\"TODO.+\"\]/, 'email    = ["author@example.com"]'
gsub_file GEMSPEC_FILE, /homepage\s+= \"TODO\"/, 'homepage    = "http://example.com"'
gsub_file GEMSPEC_FILE, /summary\s+= \"TODO.+\"/, 'summary     = "Summary"'
gsub_file GEMSPEC_FILE, /description\s+= \"TODO.+\"/, 'description = "Description"'

gsub_file GEMSPEC_FILE, /spec\.metadata\[\"allowed_push_host\"\]\s+= \"TODO.+\"/, ''
gsub_file GEMSPEC_FILE, /\[\"source_code_uri\"\]\s+= \"TODO.+\"/, '["source_code_uri"]     = spec.homepage'
gsub_file GEMSPEC_FILE, /spec\.metadata\[\"changelog_uri\"\]\s+= \"TODO.+\"/, ''
