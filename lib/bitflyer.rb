require "bitflyer/version"
require "bitflyer/orders"
require "bitflyer/net"
require "bitflyer/model"

module Bitflyer
  class << self
    # API Key
    attr_accessor :key
    # API secret
    attr_accessor :secret
  end

  def self.setup
    yield self
  end

  def self.configured?
    key && secret
  end

  def self.sanity_check!
    unless configured?
      raise MissingConfigExeception.new("Bitflyer Gem not properly configured")
    end
  end

  class MissingConfigExeception < RuntimeError; end
end
