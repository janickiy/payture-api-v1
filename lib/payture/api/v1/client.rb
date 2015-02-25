module Payture::Api::V1

  class Client
    Dir[File.expand_path("../client/*.rb", __FILE__)].each{|f| require f}

    attr_accessor *Configuration::VALID_OPTIONS_KEYS

    def initialize(options={})
      options = Payture::Api::V1.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end

      self.class.send(:include, Client::PaytureApi) if 'api' == self.api_type
      self.class.send(:include, Client::PaytureApim) if 'apim' == self.api_type
      self.class.send(:include, Client::PaytureVwapi) if 'vwapi' == self.api_type
    end

    def url
      "https://#{host}.#{Configuration::DOMAIN}/#{api_type}/"
    end

    def api_methods
      API_METHODS.map{|method| method.to_snakecase }
    end

  end

end