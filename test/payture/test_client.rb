require 'minitest_helper'

describe "Client" do

  before do
    @keys = Payture::Api::V1::Configuration::VALID_OPTIONS_KEYS

    @default_configuration = {
      api_type: 'api',
      host: 'sandbox',
      key: 'Merchant',
      password: nil,
      user_agent: "Payture API V1 Ruby Gem #{Payture::Api::V1::VERSION}"
    }

    @custom_configuration = {
      api_type: 'vwapi',
      host: 'secure',
      key: 'MerchantCustom',
      password: '123',
      user_agent: "Payture API V1 Ruby Gem"
    }
  end

  after do
    Payture::Api::V1.reset
  end


  describe "with default configuration" do
    let(:client) { Payture::Api::V1::Client.new }

    it "should inherit module configuration" do
      @keys.each do |key|
        client.send(key).must_equal @default_configuration[key]
      end
    end
  end


  describe "with module configuration" do
    let(:client) { Payture::Api::V1::Client.new }

    before do
      Payture::Api::V1.configure do |config|
        @custom_configuration.each do |key, value|
          config.send("#{key}=", value)
        end
      end
    end

    it "should inherit module configuration" do
      @custom_configuration.each do |key, value|
        client.send(key).must_equal value
      end
    end
  end


  describe "with class configuration" do
    describe "during initialization" do
      let(:client) { Payture::Api::V1::Client.new(@custom_configuration) }

      it "should override module configuration" do
        @keys.each do |key|
          client.send(key).must_equal @custom_configuration[key]
        end
      end
    end
  end


  describe "during initialization" do
    let(:client) { Payture::Api::V1::Client.new(@custom_configuration) }

    it "should override module configuration" do
      @keys.each do |key|
        client.send(key).must_equal @custom_configuration[key]
      end
    end
  end


  describe "after initilization" do
    let(:client) do
      client = Payture::Api::V1::Client.new
      @custom_configuration.each { |key, value| client.send("#{key}=", value) }
      client
    end

    it "should override module configuration after init" do
      @keys.each do |key|
        client.send(key).must_equal @custom_configuration[key]
      end
    end
  end

end