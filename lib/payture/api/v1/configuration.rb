module Payture
  module Api
    module V1
      module Configuration

        DOMAIN = 'payture.com'

        DEFAULT_API_TYPE = 'api' # api, apim, vwapi
        DEFAULT_HOST = 'sandbox' # sandbox, secure
        DEFAULT_KEY = 'MerchantKey'
        DEFAULT_PASSWORD = nil
        DEFAULT_USER_AGENT  = "Payture API V1 Ruby Gem #{Payture::Api::V1::VERSION}".freeze

        VALID_OPTIONS_KEYS = [
          :api_type,
          :host,
          :key,
          :password,
          :user_agent
        ].freeze

        attr_accessor *VALID_OPTIONS_KEYS

        def self.extended(base)
          base.reset
        end

        def reset
          self.api_type = DEFAULT_API_TYPE
          self.host = DEFAULT_HOST
          self.key = DEFAULT_KEY
          self.password = DEFAULT_PASSWORD
          self.user_agent = DEFAULT_USER_AGENT
        end

        def configure
          yield self
        end

        def options
          Hash[ * VALID_OPTIONS_KEYS.map { |key| [key, send(key)] }.flatten ]
        end
      end
    end
  end
end