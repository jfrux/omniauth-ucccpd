# OmniAuth ucccpd

[![Gem Version](http://img.shields.io/gem/v/omniauth-ucccpd.svg)][gem]
[![Build Status](http://img.shields.io/travis/intridea/omniauth-ucccpd.svg)][travis]
[![Dependency Status](http://img.shields.io/gemnasium/intridea/omniauth-ucccpd.svg)][gemnasium]
[![Code Climate](http://img.shields.io/codeclimate/github/intridea/omniauth-ucccpd.svg)][codeclimate]
[![Coverage Status](http://img.shields.io/coveralls/intridea/omniauth-ucccpd.svg)][coveralls]

[gem]: https://rubygems.org/gems/omniauth-ucccpd
[travis]: http://travis-ci.org/intridea/omniauth-ucccpd
[gemnasium]: https://gemnasium.com/intridea/omniauth-ucccpd
[codeclimate]: https://codeclimate.com/github/intridea/omniauth-ucccpd
[coveralls]: https://coveralls.io/r/intridea/omniauth-ucccpd

This gem contains a generic ucccpd strategy for OmniAuth. It is meant to serve
as a building block strategy for other strategies and not to be used
independently (since it has no inherent way to gather uid and user info).

## Creating an ucccpd Strategy

To create an OmniAuth ucccpd strategy using this gem, you can simply subclass
it and add a few extra methods like so:

```ruby
require 'omniauth-ucccpd'

module OmniAuth
  module Strategies
    class SomeSite < OmniAuth::Strategies::ucccpd
      # Give your strategy a name.
      option :name, "some_site"

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, {:site => "https://api.somesite.com"}

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid{ raw_info['id'] }

      info do
        {
          :name => raw_info['name'],
          :email => raw_info['email']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/me').parsed
      end
    end
  end
end
```

That's pretty much it!

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/intridea/omniauth-ucccpd/trend.png)](https://bitdeli.com/free "Bitdeli Badge")
