# Evil Chef

Evil Chef is a library that allows running Chef as a library from other applications.

[![Build Status](https://travis-ci.org/avishai-ish-shalom/evil-chef.png)](https://travis-ci.org/avishai-ish-shalom/evil-chef)

## Installation

Add this line to your application's Gemfile:

    gem 'evil-chef'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install evil-chef

## Usage

Require the library, instanciate a runner objet, then use the `recipe_eval` or `manage_resource` methods. E.g.:

    require 'evil-chef'
    chef_runner = EvilChef::Runner.new
    chef_runner.recipe_eval do
        package "ntp"
        service "ntp" do
            action [:start, :enable]
        end
    end

    chef_runner.manage_resource(:service, "cups", :disable)

The Runner object will run Ohai when initializing, so init is a little slow. The runner objet also keeps the state of the node object between recipe runs, accessible via the `node` attribute.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
