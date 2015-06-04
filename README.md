SpreeZonesByZipCode
===================

Adds the ability to create zip codes and then used for zones. This extension is compatible with Spree 2.3

Installation
------------

Add spree_zones_by_zip_code to your Gemfile:

```ruby
gem 'spree_zones_by_zip_code'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_zones_by_zip_code:install
```

Testing
-------

First bundle your dependencies, then run `rake`. `rake` will default to building the dummy app if it does not exist, then it will run specs. The dummy app can be regenerated by using `rake test_app`.

```shell
bundle
bundle exec rake
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_zones_by_zip_code/factories'
```

Copyright (c) 2015 [name of extension creator], released under the New BSD License
