source 'https://rubygems.org'
ruby "2.6.3"
gem 'rails',                   '5.1.6'
gem 'bcrypt',                  '3.1.12'
gem 'faker',                   '1.7.3'
gem 'carrierwave',             '1.2.2'
gem 'mini_magick',             '4.7.0'
gem 'bootstrap-sass',          '3.3.7'
gem 'kaminari'
gem 'coffee-script'
gem "chartkick"
gem 'chartable'
gem 'puma',                    '3.9.1'
gem 'sass-rails',              '5.0.6'
gem 'uglifier',                '3.2.0'
gem 'coffee-rails',            '4.2.2'
gem 'jquery-rails',            '4.3.1'
gem 'turbolinks',              '5.0.1'
gem 'jbuilder',                '2.7.0'
gem 'hirb', group:[:development,:test]
gem 'hirb-unicode', group:[:development,:test]
gem 'better_errors',group:[:development,:test]
gem 'binding_of_caller', group:[:development,:test]
gem 'omniauth'
gem 'omniauth-twitter'
gem 'devise'
gem 'devise-i18n'
gem 'devise-i18n-views'
gem 'slim'
gem 'html2slim'
gem 'rename'
gem 'mysql2'
gem 'dotenv-rails'

#gem "rmagick", "~>2.13.4", :require => 'RMagick'
group :development, :test do
 # gem 'sqlite3', '1.3.13'
  gem 'byebug',  '9.0.6', platform: :mri
  gem 'rspec-rails'
  gem 'factory_bot_rails'
end

group :development do
  gem 'web-console',           '3.5.1'
  gem 'listen',                '3.1.5'
  gem 'spring',                '2.0.2'
  gem 'spring-watcher-listen', '2.0.1'
end

group :test do
  gem 'rails-controller-testing', '1.0.2'
  gem 'minitest',                 '5.10.3'
  gem 'minitest-reporters',       '1.1.14'
  gem 'guard',                    '2.14.1'
  gem 'guard-minitest',           '2.4.6'
  gem 'capybara', '~> 2.15.2'
end

group :production do
  #gem 'pg',   '0.20.0'
  gem 'fog',  '1.42'
end

# Windows環境ではtzinfo-dataというgemを含める必要があります
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]