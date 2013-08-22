require "lita"

module Lita
  module Handlers
    class Memegen < Handler

    
    route %r{/(memegen )?(Y U NO) (.+)/i}, :y_u_no, command: true, help: {
      "karma worst [N]" => <<-HELP.chomp
Lists the bottom N terms by karma. N defaults to 5.
HELP
    }
    

    def self.default_config(config)
      config.username = nil
      config.password = nil
      config.dimensions = nil
    end

    def y_u_no(response)
      puts response.matches.inspect
      response.reply call_memegen(1,2, response.matches[0][0], response.matches[0][1])
    end

    private 

    def call_memegen(generator_id, image_id, line1, line2)
      "BLAH #{generator_id}, #{image_id}, '#{line1}', '#{line2}'"
    end


    Lita.register_handler(Memegen)
  end
end