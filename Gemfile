source 'https://rubygems.org'

ruby '1.9.3'

# Core application
gem 'rails', '3.2.11'

# Content management system (CMS)
gem 'locomotive_cms', '~> 2.0.0.rc12', :require => 'locomotive/engine'

# Heroku hosting specific requirement
gem 'locomotive-heroku', '~> 0.0.2', :require => 'locomotive/heroku'

# Assets management
group :assets do
  gem 'sass-rails',     '~> 3.2.6'
  gem 'coffee-rails',   '~> 3.2.2'
  gem 'uglifier',       '>= 1.3.0'
  gem 'compass-rails',  '~> 1.0.3'
end

group :development do
  gem 'unicorn'
end

group :production do
  gem 'thin'
end
