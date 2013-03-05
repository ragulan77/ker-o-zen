source 'https://rubygems.org'

# Core application
gem 'rails', '3.2.12'


# Content management system (CMS)
gem 'locomotive_cms', '~> 2.0.0.rc13', :git => "git://github.com/Treize37/engine.git", :branch => "master"
# gem 'locomotive_cms', '~> 2.0.0.rc11'

# Heroku hosting specific requirement
gem 'locomotive-heroku', '~> 0.0.2', :git => "git://github.com/Treize37/locomotive-heroku.git", :branch => "master"
# gem 'locomotive-heroku', '~> 0.0.2', :require => 'locomotive/heroku'

# Assets management
group :assets do
  gem 'sass-rails',     '~> 3.2.4'
  gem 'coffee-rails',   '~> 3.2.2'
  gem 'uglifier',       '~> 1.2.4'
  gem 'compass-rails',  '~> 1.0.2'
end

group :development do
  gem 'unicorn'
end

group :production do
  gem 'thin'
end
