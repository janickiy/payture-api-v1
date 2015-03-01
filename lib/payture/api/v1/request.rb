module Payture::Api::V1
  class Request

    attr_reader :response, :result

    def initialize(url, params)
      params = prepare_params(params)
      @response = rest_client.post(url, params)
      @result = Response.new(response).result
    end

    def rest_client
      @rest_client ||= RestClient
    end

    def endode_data(data)
      if data.kind_of?(Hash)
        data = convert_keys(data)
        data = Array[data.map {|k, v| "#{k}=#{v}" }].join(';')
        data = CGI.escape(data)
      end

      data
    end

    def convert_keys(params)
      mappings = {
        'Pan' => 'PAN',
        'Ip' => 'IP',
        'Data' => 'DATA',
        'VwId' => 'VWID',
        'VwUserLgn' => 'VWUserLgn',
        'VwUserPsw' => 'VWUserPsw'
      }

      Hash[params.map {|k, v| [k.to_s.to_camelcase(mappings), v] }]
    end

    def prepare_params(params)
      params = convert_keys(params)
      params = Hash[params.map {|k, v| v.kind_of?(Hash) ? [k, endode_data(v)] : [k, v] }]
    end

  end
end