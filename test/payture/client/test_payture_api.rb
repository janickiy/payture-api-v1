require 'minitest_helper'

describe "PaytureApi" do

  let(:client) { Payture::Api::V1::Client.new(api_type: 'api', key: 'Merchant', password: '123') }
  let(:order_id) { SecureRandom.hex }
  let(:amount) { 12156 }
  let(:pay_info) do
    {
      pan: '4111111111111112',
      e_month: 12,
      e_year: 2015,
      card_holder: 'Ivan Ivanov',
      secure_code: '123',
      order_id: order_id,
      amount: amount
    }
  end

  it "instance has api_type = api" do
    client.api_type.must_equal 'api'
  end

  it "pay" do
    result = client.pay(pay_info, order_id, amount)
    result[:success].must_equal 'True'
  end

  it "block" do
    result = client.block(pay_info, order_id, amount)
    result[:success].must_equal 'True'
  end

  it "charge" do
    result = client.block(pay_info, order_id, amount)
    order_id = result[:order_id]

    result = client.charge(order_id)
    result[:success].must_equal 'True'
  end

  it "unblock" do
    result = client.block(pay_info, order_id, amount)
    order_id = result[:order_id]

    result = client.unblock(order_id, amount)
    result[:success].must_equal 'True'
  end

  it "refund" do
    result = client.pay(pay_info, order_id, amount)
    order_id = result[:order_id]

    result = client.refund(order_id, amount)
    result[:success].must_equal 'True'
  end

  it "get_state" do
    result = client.pay(pay_info, order_id, amount)
    order_id = result[:order_id]

    result = client.get_state(order_id)
    result[:success].must_equal 'True'
  end

end