require "lita"

module Lita
  module Handlers
    class Memegen < Handler

      def self.default_config(config)
        config.username = nil
        config.password = nil
      end
      
      route %r{(!meme )?(Y U NO) (.+)}i,                                    :meme_y_u_no, command: false
      route %r{(!meme )?(I DON'?T ALWAYS .*) (BUT WHEN I DO,? .*)}i,        :meme_i_dont_always, command: false
      route %r{(!meme )?(.*)(O\s?RLY\??.*)}i,                               :meme_orly, command: false
      route %r{(!meme )?(.*)(SUCCESS|NAILED IT.*)}i,                        :meme_success, command: false
      route %r{(!meme )?(.*) (ALL the .*)}i,                                :meme_all_the, command: false
      route %r{(!meme )?(.*) (\w+\sTOO DAMN .*)}i,                          :meme_too_damn, command: false
      route %r{(!meme )?(GOOD NEWS EVERYONE[,.!]?) (.*)}i,                  :meme_good_news, command: false
      route %r{(!meme )?(NOT SURE IF .*) (OR .*)}i,                         :meme_not_sure_if, command: false
      route %r{(!meme )?(YO DAWG .*) (SO .*)}i,                             :meme_yo_dawg, command: false
      route %r{(!meme )?(ALL YOUR .*) (ARE BELONG TO US)}i,                 :meme_are_belong, command: false
      route %r{(!meme )?(.*) (FUCK YOU)}i,                                  :meme_fuck_you, command: false
      route %r{(!meme )?(.*) (You'?re gonna have a bad time)}i,             :meme_bad_time, command: false
      route %r{(!meme )?(one does not simply) (.*)}i,                       :meme_simply, command: false
      route %r{(!meme )?(grumpy cat) (.*),(.*)}i,                           :meme_grumpy_cat, command: false
      route %r{(!meme )?(it looks like you're|it looks like you) (.*)}i,    :meme_looks_like, command: false
      route %r{(!meme )?(AM I THE ONLY ONE AROUND HERE) (.*)}i,             :meme_am_i_only, command: false
      route %r{(!meme )?(.*)(NOT IMPRESSED*)}i,                              :meme_not_impressed, command: false
      route %r{(!meme )?(PREPARE YOURSELF) (.*)}i,                           :meme_prepare_yourself, command: false
      route %r{(!meme )?(WHAT IF I TOLD YOU) (.*)}i,                         :meme_what_if_i, command: false
      route %r{(!meme )?(.*) (BETTER DRINK MY OWN PISS)}i,                   :meme_better_drink, command: false


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


      private 

      def generate_meme(response, generator_id, image_id)
        line1 = response.matches[0][1]
        line2 = response.matches[0][2]
        return if Lita.config.handlers.memegen.username.nil? || Lita.config.handlers.memegen.password.nil?
        
        http_resp = http.get(
          'http://version1.api.memegenerator.net/Instance_Create',
          username: Lita.config.handlers.memegen.username,
          password: Lita.config.handlers.memegen.password,
          languageCode: 'en',
          generatorID: generator_id,
          imageID: image_id,
          text0: line1,
          text1: line2
          )

        if http_resp.status == 200
          data = MultiJson.load(http_resp.body)

          if data['success']
            response.reply data['result']['instanceImageUrl']
          else
            response.reply "Error: Unable to generate a meme image"
          end

        else
          response.reply "Error: Unable to generate a meme image"
        end

      end



    end

    Lita.register_handler(Memegen)
  end
end