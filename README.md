# lita-memegen

[![Build Status](https://travis-ci.org/webdestroya/lita-memegen.png)](https://travis-ci.org/webdestroya/lita-memegen)
[![Code Climate](https://codeclimate.com/github/webdestroya/lita-memegen.png)](https://codeclimate.com/github/webdestroya/lita-memegen)
[![Coverage Status](https://coveralls.io/repos/webdestroya/lita-memegen/badge.png)](https://coveralls.io/r/webdestroya/lita-memegen)

**lita-memegen** is a handler for [Lita](https://github.com/jimmycuadra/lita) that generates meme images using memegenerator.net.

## Installation

Add lita-memegen to your Lita instance's Gemfile:

``` ruby
gem "lita-memegen"
```

## Configuration

You will need to register an account on memegenerator.net and provide the username/password for the account.

```
Lita.configure do |config|
  config.handlers.memegen.username = 'username'
  config.handlers.memegen.password = 'password'
end
```

## Usage

TODO

## License

[MIT](http://opensource.org/licenses/MIT)