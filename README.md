# lita-memegen

[![Build Status](https://travis-ci.org/webdestroya/lita-memegen.png)](https://travis-ci.org/webdestroya/lita-memegen)
[![Code Climate](https://codeclimate.com/github/webdestroya/lita-memegen.png)](https://codeclimate.com/github/webdestroya/lita-memegen)
[![Coverage Status](https://coveralls.io/repos/webdestroya/lita-memegen/badge.png)](https://coveralls.io/r/webdestroya/lita-memegen)

**lita-memegen** is a handler for [Lita](https://github.com/jimmycuadra/lita) that generates meme images using memegenerator.net. This is based on the hubot memegenerator script.

## Installation

Add lita-memegen to your Lita instance's Gemfile:

``` ruby
gem "lita-memegen"
```

## Configuration

You will need to register an account on memegenerator.net and provide the username/password for the account.

```
Lita.configure do |config|

  # This requires that all memes be sent as commands. If this is false, the bot will listen in the channel
  config.handlers.memegen.command_only = true

  config.handlers.memegen.username = 'username'
  config.handlers.memegen.password = 'password'
end
```

## Usage

* `Y U NO <text>` - Generates the Y U NO GUY with the bottom caption of <text>
* `I don't always <something> but when i do <text>` - Generates The Most Interesting man in
* `<text> ORLY?` - Generates the ORLY? owl with the top caption of <text>
* `<text> (SUCCESS|NAILED IT)` - Generates success kid with the top caption of <text>
* `<text> ALL the <things>` - Generates ALL THE THINGS
* `<text> TOO DAMN <high>` - Generates THE RENT IS TOO DAMN HIGH guy
* `good news everyone! <news>` - Generates Professor Farnsworth
* `khanify <text>` - TEEEEEEEEEEEEEEEEEXT!
* `Not sure if <text> or <text>` - Generates Futurama Fry
* `Yo dawg <text> so <text>` - Generates Yo Dawg
* `ALL YOUR <text> ARE BELONG TO US` - Generates Zero Wing with the caption of <text>
* `if <text>, <word that can start a question> <text>?` - Generates Philosoraptor
* `<text> FUCK YOU` - Angry Linus
* `(Oh|You) <text> (Please|Tell) <text>` - Willy Wonka
* `<text> you're gonna have a bad time` - Bad Time Ski Instructor
* `one does not simply <text>` - Lord of the Rings Boromir
* `it looks like (you|you're) <text>` - Generates Clippy
* `AM I THE ONLY ONE AROUND HERE <text>` - The Big Lebowski
* `<text> NOT IMPRESSED` - Generates McKayla Maroney
* `PREPARE YOURSELF <text>` - Generates GoT
* `WHAT IF I TOLD YOU <text>` - Generates Morpheus
* `<text> BETTER DRINK MY OWN PISS` - Generates Bear Grylls
* '<text> wow' - Generates Doge

## License

[MIT](http://opensource.org/licenses/MIT)
