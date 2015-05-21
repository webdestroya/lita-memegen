require "lita"

module Lita
  module Handlers
    class Memegen < Handler

      def self.default_config(config)
        config.command_only = true
        config.username = nil
        config.password = nil
      end

      route %r{(y u no) (.+)}i,                                         :meme_y_u_no,           help: { "y u no..." => "generates Y U NO meme"}
      route %r{(i don'?t always .*) (but when i do,? .*)}i,             :meme_i_dont_always,    help: { "i don't always... but when i do,..." => "generates I DON'T ALWAYS meme"}
      route %r{(.*)(o\s?rly\??.*)}i,                                    :meme_orly,             help: { "...o rly..." => "generates O RLY meme" }
      route %r{(.*)(SUCCESS|NAILED IT.*)},                              :meme_success,          help: { "...SUCCESS" => "(case sensitive) generates SUCCESS meme", "...NAILED IT..." => "(case sensitive) generates NAILED IT meme" }
      route %r{(.*) (ALL the .*)},                                      :meme_all_the,          help: { "...ALL the..." => "(case sensitive) generates ALL the <things> meme" }
      route %r{(.*) (\w+\stoo damn .*)}i,                               :meme_too_damn,         help: { "...too damn..." => "generates TOO DAMN meme" }
      route %r{(good news everyone[,.!]?) (.*)}i,                       :meme_good_news,        help: { "good news everyone..." => "generates GOOD NEWS EVERYONE meme" }
      route %r{(not sure if .*) (or .*)}i,                              :meme_not_sure_if,      help: { "not sure if... or..." => "generates NOT SURE IF... OR meme" }
      route %r{(yo dawg .*) (so .*)}i,                                  :meme_yo_dawg,          help: { "yo dawg... so..." => "generates YO DAWG meme" }
      route %r{(all your .*) (are belong to us)}i,                      :meme_are_belong,       help: { "all your... are belong to us" => "generates ALL YOUR... ARE BELONG TO US meme" }
      route %r{(.*) (fuck you)$}i,                                      :meme_fuck_you,         help: { "...fuck you" => "generates ...FUCK YOU meme" }
      route %r{(.*) (you'?re gonna have a bad time)}i,                  :meme_bad_time,         help: { "...you're going have a bad time" => "generates You're gonna have a bad time meme" }
      route %r{(one does not simply) (.*)}i,                            :meme_simply,           help: { "one does not simply..." => "generates one does not simply... meme" }
      route %r{(grumpy cat) (.*),(.*)}i,                                :meme_grumpy_cat,       help: { "grumpy cat... ,..." => "generates grumpy cat... ,... meme" }
      route %r{(it looks like you'?re|it looks like you) (.*)}i,        :meme_looks_like,       help: { "it looks like you're..." => "generates it looks like you're... meme", "it looks like you..." => "(case insensitive) generates it looks like you.. meme" }
      route %r{(am i the only one around here) (.*)}i,                  :meme_am_i_only,        help: { "am I the only one around here..." => "generates AM I THE ONLY ONE AROUND HERE... meme" }
      route %r{(.*)(not impressed*)}i,                                  :meme_not_impressed,    help: { "...not impressed" => "generates ...NOT IMPRESSED meme" }
      route %r{(prepare yourself) (.*)}i,                               :meme_prepare_yourself, help: { "prepare yourself..." => "generates PREPARE YOURSELF... meme" }
      route %r{(what if i told you) (.*)}i,                             :meme_what_if_i,        help: { "what if I told you..." => "generates WHAT IF I TOLD YOU... meme" }
      route %r{(.*) (better drink my own piss)}i,                       :meme_better_drink,     help: { "..better drink my own piss" => "generates ...BETTER DRINK MY OWN PISS meme" }
      route %r{^khanify (.*)}i,                                         :meme_khanify,          help: { "khanify ..." => "generates khan meme" }
      route %r{(so|very|much|such) (.*) (so|very|much|such) (.*) wow}i, :meme_doge,             help: { "so|very|much|such... so|very|much|such... wow" => "generates doge meme" }
      route %r{(imma let you finish) (.*)}i,                            :meme_kanye,            help: { "imma let you finish ..." => "generates kanye meme" }


      def meme_y_u_no(response)
        generate_meme(response, 2, 166088)
      end

      def meme_i_dont_always(response)
        generate_meme(response, 74, 2485)
      end

      def meme_orly(response)
        generate_meme(response, 920, 117049)
      end

      def meme_success(response)
        generate_meme(response, 121, 1031)
      end

      def meme_all_the(response)
        generate_meme(response, 6013, 1121885)
      end

      def meme_too_damn(response)
        generate_meme(response, 998, 203665)
      end

      def meme_good_news(response)
        generate_meme(response, 1591, 112464)
      end

      def meme_not_sure_if(response)
        generate_meme(response, 305, 84688)
      end

      def meme_yo_dawg(response)
        generate_meme(response, 79, 108785)
      end

      def meme_are_belong(response)
        generate_meme(response, 349058, 2079825)
      end

      def meme_fuck_you(response)
        generate_meme(response, 1189472, 5044147)
      end

      def meme_bad_time(response)
        generate_meme(response, 825296, 3786537)
      end

      def meme_simply(response)
        generate_meme(response, 274947, 1865027)
      end

      def meme_grumpy_cat(response)
        generate_meme(response, 1590955, 6541210)
      end

      def meme_looks_like(response)
        generate_meme(response, 20469, 1159769)
      end

      def meme_am_i_only(response)
        generate_meme(response, 953639, 4240352)
      end

      def meme_not_impressed(response)
        generate_meme(response, 1420809, 5883168)
      end

      def meme_prepare_yourself(response)
        generate_meme(response, 414926, 2295701)
      end

      def meme_what_if_i(response)
        generate_meme(response, 1118843, 4796874)
      end

      def meme_better_drink(response)
        generate_meme(response, 92, 89714)
      end

      def meme_khanify(response)
        generate_meme(response, 6443, 1123022, line1: "", line2: khanify(response.matches[0][0]))
      end

      def khanify(phrase)
        shouty_phrase = phrase.upcase
        last_vowel_index = shouty_phrase.rindex(/[AEIOU]/) || -1 # default to final consonant
        last_vowel = shouty_phrase[last_vowel_index]
        "#{shouty_phrase[0..last_vowel_index]}#{last_vowel * 10}#{shouty_phrase[last_vowel_index..-1]}!!!!"
      end

      def meme_doge(response)
        doge1, text1, doge2, text2 = *response.matches.first
        generate_meme(response, 2452817, 9861901, line1: "#{doge1} #{text1}",
                                                  line2: "#{doge2} #{text2} wow")
      end

      def meme_kanye(response)
        generate_meme(response, 1988183, 8275549)
      end

      private

      def generate_meme *args
        MemeGenerator.generate_meme(*args)
      end
    end

    Lita.register_handler(Memegen)
  end
end
