require 'test/unit'
require 'k_paypal'

class AddressTest < Test::Unit::TestCase
	def test_return_address_class
		address = KPaypal::Address.new
		assert_instance_of KPaypal::Address, address, 'Should return address object'
	end
end