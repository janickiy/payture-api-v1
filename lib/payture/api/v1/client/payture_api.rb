module Payture::Api::V1

  class Client
    module PaytureApi

      API_METHODS = %w(Pay Block Charge Unblock Refund GetState)

      API_METHODS.each do |method_name|
        method = method_name.to_snakecase
        define_method method do |options|
          options ||= {}
          # TODO: response = api.get(method_name, options)
        end
      end

    end
  end

end