source 'https://rubygems.org'

# Specify a ruby version
# http://gembundler.com/v1.2/whats_new.html
# https://devcenter.heroku.com/articles/ruby-versions
ruby '1.9.3'

# Core rails stuff
gem 'rails', '~> 3.2.11'
gem 'sass-rails'
gem 'coffee-rails'
gem 'uglifier'

# Database
# To install the 'pg' gem, the postgres bin directory must be on your path
# export PATH=/path/to/postgres/bin:${PATH}
gem 'pg'

# View Layer
gem "jquery-rails" # jquery and jquery-ui
gem 'haml'
gem 'bluecloth' # markdown
gem 'kaminari' # pagination

# AAA - Authentication, Authorization, and Access Control
gem 'devise'
gem 'cancan'

# Payments
gem 'authorize-net'

# Model Layer
gem 'validates_timeliness'

# uncaught exception notification
gem 'exception_notification'

# After migrating to Cedar, Heroku recommends thin over webrick
gem 'thin'

# A simple helper to get an HTML select list of countries.
# The jaredbeck fork uses ISO 3166-1 alpha-2 codes as option values,
# instead of the full country names.
gem 'country-select', :git => 'git://github.com/jaredbeck/country-select.git'

# rspec-rails wants to be in the :development group
# to "expose generators and rake tasks"
group :test, :development do
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'rspec-rails'
  gem 'rspec-mocks'
end

group :development do
  gem 'haml-rails'
  gem 'html2haml'
  gem 'quiet_assets'
end

group :test do
  gem 'capybara'
  gem 'launchy' # provides `save_and_open_page`
	gem 'deep_merge' # recursively merge hashes
	gem 'factory_girl'
	gem 'factory_girl_rails'
	gem 'spork-rails'
	gem 'rb-fsevent'

	# Using edge spork solely to get the -q (quiet) option so that
	# we can pass :quiet => true to guard 'spork'.  Before this,
	# I had been using spork 1.0.0rc3
	gem 'spork', :git => 'https://github.com/sporkrb/spork.git'
end

# To keep your heroku slug size down, try this
# heroku config:add BUNDLE_WITHOUT="development:test"
