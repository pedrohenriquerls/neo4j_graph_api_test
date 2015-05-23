# Generated from http://github.com/guard/guard-rspec

guard :rspec, cmd: "bundle exec rspec" do

  watch(%r{^models/(.+)\.rb$})          { |m| "spec/models/#{m[1]}_spec.rb" }
  watch(%r{^spec/models/(.+)\.rb$})     { |m| "spec/models/#{m[1]}.rb" }
  watch(%r{^lib/(.+)\.rb$})             { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch(%r{^spec/lib/(.+)\.rb$})        { |m| "spec/lib/#{m[1]}.rb" }
  watch(%r{^spec/.+_spec\.rb$})         { "spec" }
  watch(%r{^spec/support/(.+)\.rb$})    { "spec" }
  watch('spec/spec_helper.rb')          { "spec" }

  watch('app.rb')                       { "spec" }
end

guard :rubocop do
  watch(%r{^models/(.+)\.rb$})          { |m| "app/models/#{m[1]}.rb" }
  watch(%r{^lib/(.+)\.rb$})             { |m| "lib/#{m[1]}.rb" }
  watch(%r{^app/(.+)\.rb$})             { |m| "app/#{m[1]}.rb" }
end