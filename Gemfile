source 'https://rubygems.org'
ruby '2.0.0'

gem 'rake'
gem 'sinatra'
gem 'thin'
gem 'neo4j', '3.0.4'

group :development do
  gem 'guard-rubocop'
end

group :test do
	gem 'rspec'
  gem 'rack-test'
  gem 'database_cleaner'
end

group :development, :test do
  gem 'shotgun', '0.9.1'

  gem 'foreman'
  gem 'guard-rspec'
end

