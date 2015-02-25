require 'minitest_helper'

describe "Payture" do
  it 'should have a version' do
    Payture::Api::V1::VERSION.wont_be_nil
  end

  it 'is valid' do
    Payture::Api::V1.must_be_kind_of Module
  end
end