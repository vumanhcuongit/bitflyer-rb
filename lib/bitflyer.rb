require "bitflyer/version"

module Bitflyer
  class << self
    # API Key
    attr_accessor :key
    # API secret
    attr_accessor :secret
  end
end
