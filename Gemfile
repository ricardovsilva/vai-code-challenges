source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
gem 'puma', '~> 4.1'
gem 'active_model_serializers', '~> 0.10.0'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'mini_magick'
gem 'exif'
gem 'pg'
gem "aws-sdk-s3", require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails'
  gem 'database_cleaner'
  gem 'sqlite3', '~> 1.4'
  gem 'rspec'
  gem 'rspec-rails', '~> 3.6'
  gem 'rspec-expectations'
end


group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'faker'
  gem 'simplecov'
  gem 'simplecov-console'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
