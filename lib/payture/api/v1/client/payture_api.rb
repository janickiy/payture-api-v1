module Payture::Api::V1

  class Client
    module PaytureApi

      def pay(pay_info, order_id, amount)
        params = {
          key: self.key,
          pay_info: pay_info,
          order_id: order_id,
          amount: amount
        }

        request = make_request('Pay', params)
        request.result
      end

      def block(pay_info, order_id, amount)
        params = {
          key: self.key,
          pay_info: pay_info,
          order_id: order_id,
          amount: amount
        }

        request = make_request('Block', params)
        request.result
      end

      def charge(order_id)
        params = {
          key: self.key,
          order_id: order_id
        }

        request = make_request('Charge', params)
        request.result
      end

      def unblock(order_id, amount)
        params = {
          key: self.key,
          order_id: order_id,
          amount: amount
        }

        request = make_request('Unblock', params)
        request.result
      end

      def refund(order_id, amount)
        params = {
          key: self.key,
          order_id: order_id,
          amount: amount
        }

        request = make_request('Refund', params)
        request.result
      end

      def get_state(order_id)
        params = {
          key: self.key,
          order_id: order_id
        }

        request = make_request('GetState', params)
        request.result
      end

    end
  end

end
