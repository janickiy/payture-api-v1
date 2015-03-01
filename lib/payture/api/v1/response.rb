require "rexml/document"

module Payture::Api::V1
  class Response

    attr_reader :result

    def initialize(response)
      #puts response.body
      return nil if response.body.empty?
      doc = REXML::Document.new(response.body)
      @result = Hash[doc.elements.first.attributes.map { |a| [ a.first.to_snakecase.to_sym, a.last ] }]
    end

  end
end