source 'https://rubygems.org'

gem 'rails', '3.2.9'
gem 'dotenv', :groups => [:development, :test]
gem 'sqlite3'
gem 'paperclip', :git => 'git://github.com/thoughtbot/paperclip.git'
gem 'fog'

#Sunspot junk
gem "sunspot"
gem "sunspot_rails"
gem 'sunspot_cell', :git => 'git://github.com/zheileman/sunspot_cell.git'

# This is for running Sunspot locally. I suspect something is wrong with my schema config. 
group :development do
  gem 'sunspot_solr'
end


group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

