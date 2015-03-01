module Payture::Api::V1

  class Client
    module PaytureApim

      def init(session_type, order_id, amount, ip, options={})
        data = {
          session_type: session_type,
          order_id: order_id,
          amount: amount,
          ip: ip
        }.merge!(options)

        params = {
          key: self.key,
          data: data
        }

        request = make_request('Init', params)
        request.result
      end

      def pay_url(session_id)
        "#{url_for('Pay')}?SessionId=#{session_id}"
      end

      def charge(order_id)
      end

      def unblock(order_id, amount)
      end

      def refund(order_id, amount)
      end

      def pay_status(order_id)
      end

    end
  end

end
