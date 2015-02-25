module Payture::Api::V1

  class Client
    module PaytureApim

      API_METHODS = %w(Init Pay Charge Unblock Refund PayStatus)

      API_METHODS.each do |method_name|
        underscore_method_name = method_name.to_snakecase
        define_method underscore_method_name do |options|
          options ||= {}
          # TODO: response = api.get(method_name, options)
        end
      end

    end
  end

end