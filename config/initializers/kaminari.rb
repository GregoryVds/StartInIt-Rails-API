# ActiveAdmin uses Kaminari for pagination and if you use will_paginate in your app, 
# you need to configure an initializer for Kaminari to avoid conflicts. 
# Put this in config/initializers/kaminari.rb

Kaminari.configure do |config|
  config.page_method_name = :per_page_kaminari
end