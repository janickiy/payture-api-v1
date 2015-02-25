require 'minitest_helper'

module Payture::Api::V1
  describe 'Payture' do

    after do
      Payture::Api::V1.reset
    end

    describe '.configure' do
      Payture::Api::V1::Configuration::VALID_OPTIONS_KEYS.each do |key|
        it "should set the #{key}" do
          Payture::Api::V1.configure do |config|
            config.send("#{key}=", key)
            Payture::Api::V1.send(key).must_equal key
          end
        end
      end
    end
  end
end