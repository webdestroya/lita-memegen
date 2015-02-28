class MemeGenerator

  def initialize response, generator_id, image_id, line1: nil, line2: nil
    @response = response
    @generator_id = generator_id
    @image_id = image_id
    @line1 = line1 || response.matches[0][0]
    @line2 = line2 || response.matches[0][1]
  end

  def self.generate_meme *args
    new(*args).generate_meme
  end

  def generate_meme
    return if ignore_non_command? || missing_credentials?
    if meme_response && meme_response['success']
      @response.reply meme_response['result']['instanceImageUrl']
    else
      reply_with_error meme_response
    end
  end

  private

  def reply_with_error message='Unknown cause'
    Lita.logger.error "#{self.class}: Unable to generate a meme image: #{message}"
    @response.reply "Error: Unable to generate a meme image"
  end

  def meme_response
    @meme_response ||= begin
      response = http.get request_endpoint, request_options
      MultiJson.load(response.body) if response.status == 200
    end
  end

  def missing_credentials?
    Lita.config.handlers.memegen.username.nil? || Lita.config.handlers.memegen.password.nil?
  end

  def ignore_non_command?
    Lita.config.handlers.memegen.command_only && !@response.message.command?
  end

  def http options={}
    default_options = { headers: { "User-Agent" => "Lita v#{Lita::VERSION}" } }
    options = default_options.merge options
    Faraday::Connection.new nil, options
  end

  def request_endpoint
    'http://version1.api.memegenerator.net/Instance_Create'
  end

  def request_options
    {
      username: Lita.config.handlers.memegen.username,
      password: Lita.config.handlers.memegen.password,
      languageCode: 'en',
      generatorID: @generator_id,
      imageID: @image_id,
      text0: @line1,
      text1: @line2
    }
  end

end
