require 'minitest_helper'

describe "Client" do

  before do
    @keys = Payture::Api::V1::Configuration::VALID_OPTIONS_KEYS

    @default_configuration = {
      api_type: 'api',
      host: 'sandbox',
      key: 'MerchantKey',
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

    it "shoud have valid url" do
      client.url.must_equal 'https://sandbox.payture.com/api/'
    end
  end


  describe "with module configuration" do
    let(:client) { Payture::Api::V1::Client.new }

    before do
      Payture::Api::V1.configure do |config|
        @keys.each do |key|
          config.send("#{key}=", key)
        end
      end
    end

    it "should inherit module configuration" do
      @keys.each do |key|
        client.send(key).must_equal key
      end
    end

    it "shoud have valid default url" do
      client.url.must_equal 'https://host.payture.com/api_type/'
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

      it "shoud have valid default url" do
        client.url.must_equal 'https://secure.payture.com/vwapi/'
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

    it "shoud have valid default url" do
      client.url.must_equal 'https://secure.payture.com/vwapi/'
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

    it "shoud have valid default url" do
      client.url.must_equal 'https://secure.payture.com/vwapi/'
    end
  end


  describe "PaytureApi" do
    it "respond to pay" do
      client = Payture::Api::V1::Client.new({api_type: 'api'})
      client.api_methods.each do |method|
        client.send(method.to_snakecase.to_sym)
      end
    end
  end


  describe "PaytureApim" do
    it "respond to pay" do
      client = Payture::Api::V1::Client.new({api_type: 'apim'})
      client.api_methods.each do |method|
        client.send(method.to_snakecase.to_sym)
      end
    end
  end


  describe "PaytureVwapi" do
    it "respond to pay" do
      client = Payture::Api::V1::Client.new({api_type: 'apim'})
      client.api_methods.each do |method|
        client.send(method.to_snakecase.to_sym)
      end
    end
  end

end