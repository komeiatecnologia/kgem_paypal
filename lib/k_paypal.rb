require 'rubygems'
require 'uri'
require 'net/https'
require 'bigdecimal'
require 'forwardable'
require 'time'
require 'cgi'

require 'k_paypal/extensions/ensure_type'
require 'k_paypal/extensions/mass_assignment'
require 'k_paypal/payment_request/serializer'
require 'k_paypal/payment_request'
require 'k_paypal/item'
require 'k_paypal/items'
require 'k_paypal/transaction/serializer'
require 'k_paypal/transaction'
require 'k_paypal/address'
require 'k_paypal/set_express_checkout'
require 'k_paypal/get_express_checkout'
require 'k_paypal/do_express_checkout'
require 'k_paypal/errors'
require 'k_paypal/ipn'

module KPaypal
	class << self
		attr_accessor :user
		attr_accessor :pwd
		attr_accessor :signature
		attr_accessor :currency_code
    attr_accessor :version
    attr_accessor :by_items
    attr_accessor :mode
	end

  def self.configure(&block)
    yield self
  end

  def self.test_configure
  	KPaypal.configure do |config|
      config.user = "gerencia-facilitator_api1.komeia.com"
      config.pwd = "1405688742"
      config.signature = 'AFcWxV21C7fd0v3bYYYRCpSSRl31AUtcmSfICNQxiF-Bi2rQ7Srhc8tF'
      config.currency_code = 'BRL'
      config.version = 115
      config.by_items = false
      config.mode = 'sandbox'
    end
  end
end