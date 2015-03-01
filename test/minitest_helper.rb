require 'coveralls'
Coveralls.wear!

require 'minitest/autorun'
require 'minitest/reporters'
require "minitest-vcr"
require "webmock"

VCR.configure do |c|
  c.cassette_library_dir = 'test/cassettes'
  c.hook_into :webmock
end

MinitestVcr::Spec.configure!
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'payture/api/v1'