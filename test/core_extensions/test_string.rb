require 'minitest_helper'

describe "CoreExtensions" do
  describe "String" do
    it ".to_snakecase converts 'TestString' to 'test_string'" do
      string = "TestString".to_snakecase
      string.must_equal "test_string"
    end

    it ".to_camelcase converts 'test_string' to 'TestString'" do
      string = "test_string".to_camelcase
      string.must_equal "TestString"
    end
  end
end