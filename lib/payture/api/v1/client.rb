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
      @api_methods = %w(Register Update Delete Add Activate Remove GetList Init Pay SendCode Charge Unblock Refund PayStatus) if 'vwapi' == self.api_type

      @api_methods.map{|method| define_api_method(method.to_snakecase)}
    end

    def define_api_method(name, *args)
      self.class.send(:define_method,name) do
        # call api ...
      end
    end

    def url
      "https://#{host}.#{Configuration::DOMAIN}/#{api_type}/"
    end
  end

end