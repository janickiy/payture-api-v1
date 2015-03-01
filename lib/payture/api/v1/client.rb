module Payture::Api::V1

  class Client
    Dir[File.expand_path("../client/*.rb", __FILE__)].each{|f| require f}

    attr_accessor *Configuration::VALID_OPTIONS_KEYS
    attr_reader :api_methods

    def initialize(options={})
      options = Payture::Api::V1.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end

      self.class.send(:include, Client::PaytureApi) if 'api' == self.api_type
      self.class.send(:include, Client::PaytureApim) if 'apim' == self.api_type
      self.class.send(:include, Client::PaytureVwapi) if 'vwapi' == self.api_type
    end

    def make_request(method, params)
      Request.new(url_for(method), params)
    end

    def url_for(method)
      "https://#{host}.#{Configuration::DOMAIN}/#{api_type}/#{method}"
    end
  end

end