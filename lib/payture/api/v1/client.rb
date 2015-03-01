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

      if 'api' == self.api_type
        class << self; include Client::PaytureApi; end
      elsif 'apim' == self.api_type
        class << self; include Client::PaytureApim; end
      elsif 'vwapi' == self.api_type
        class << self; include Client::PaytureVwapi; end
      end
    end

    def make_request(method, params)
      Request.new(url_for(method), params)
    end

    def url_for(method)
      "https://#{host}.#{Configuration::DOMAIN}/#{api_type}/#{method}"
    end
  end

end