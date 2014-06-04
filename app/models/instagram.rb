module InstagramModule
  class Request

    def initialize
      Instagram.configure do |config|
        config.client_id = ENV['secret_id']
        config.access_token = ENV['token']
      end
    end
  end

end
