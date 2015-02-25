module Payture::Api::V1

  class Client
    attr_accessor *Configuration::VALID_OPTIONS_KEYS
    attr_reader :api_methods

    def initialize(options={})
      options = Payture::Api::V1.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end

      @api_methods = %w(Pay Block Charge Unblock Refund GetState) if 'api' == self.api_type
      @api_methods = %w(Init Pay Charge Unblock Refund PayStatus) if 'apim' == self.api_type
      @api_methods = %w(Register Update Delete Add Activate Remove GetList Init Pay SendCode Charge Unblock Refund PayStatus) if 'apim' == self.api_type
    end

    def url
      "https://#{host}.#{Configuration::DOMAIN}/#{api_type}/"
    end

    def method_missing(method, *args, &block)
      if @api_methods.include?(method.to_s.to_camelcase)
        self.class.send :define_method, method do
          puts method # Do something ... call the api
        end
        self.send(method)
      else
        super
      end
    end

    def respond_to?(method, include_private = false)
      if @api_methods.include?(method.to_s.to_camelcase)
        true
      else
        super
      end
    end

  end

end