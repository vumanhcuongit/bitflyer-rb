require "rest_client"
require "net/http"
require "openssl"

module Bitflyer
  module Net
    def self.to_uri(path)
      return "https://api.bitflyer.jp#{path}"
    end

    def self.get(path, options = {})
      begin
        path += "?#{URI.encode_www_form(options)}" unless options.empty?
        RestClient.get(self.to_uri(path), self.headers_for(path, options))
      rescue RestClient::BadRequest => e
        raise BadRequest.new(e.response)
      end
    end

    def self.post(path, options = {})
      begin
        RestClient.post(self.to_uri(path), options.to_json, self.headers_for(path, options, "POST"))
      rescue RestClient::BadRequest => e
        raise BadRequest.new(e.response)
      end
    end

    class BadRequest < RuntimeError; end

    private

    def self.headers_for(path, options = {}, method = "GET")
      timestamp = Time.now.to_i.to_s
      if method == "GET"
        text = timestamp + method + path
      else
        text = timestamp + method + path + options.to_json
      end

      signature = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new("sha256"), Bitflyer.secret, text)
      {
        "Content-Type" => "application/json",
        "Accept" => "application/json",
        "ACCESS-KEY" => Bitflyer.key,
        "ACCESS-TIMESTAMP" => timestamp,
        "ACCESS-SIGN" => signature
      }
    end
  end
end
