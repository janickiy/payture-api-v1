require 'minitest_helper'

describe "PaytureApim" do

  after do
    Payture::Api::V1.reset
  end

  let(:client) { Payture::Api::V1::Client.new(api_type: 'apim', key: 'Merchant', password: '123') }
  let(:order_id) { SecureRandom.hex }
  let(:ip) { '123.45.67.89' }
  let(:amount) { 12156 }

  it "instance has api_type = apim" do
    client.api_type.must_equal 'apim'
  end

  it "init" do
    result = client.init('Pay', order_id, amount, ip)
    result[:success].must_equal 'True'
  end

  it "pay_url" do
    result = client.init('Pay', order_id, amount, ip)
    session_id = result[:session_id]

    url = client.pay_url(session_id)
    url.must_equal "#{client.url_for('Pay')}?SessionId=#{session_id}"
  end

end