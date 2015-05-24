source 'https://rubygems.org'
ruby '2.2.1'

gem 'rake'
gem 'sinatra'
gem 'thin'
gem 'neo4j', '4.1.5'

group :development do
  gem 'guard-rubocop'
end

group :test do
	gem 'rspec'
  gem 'rack-test'
end

group :development, :test do
  gem 'shotgun', '0.9.1'

  gem 'foreman'
  gem 'guard-rspec'
end

