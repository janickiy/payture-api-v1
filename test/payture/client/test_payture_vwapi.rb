require 'minitest_helper'

describe "PaytureVwapi" do

  let(:client) { Payture::Api::V1::Client.new(api_type: 'vwapi') }

  it "instance has api_type = vwapi" do
    client.api_type.must_equal 'vwapi'
  end

end