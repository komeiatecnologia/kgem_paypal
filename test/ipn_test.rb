require 'test/unit'
require 'k_paypal'

class IpnTest < Test::Unit::TestCase
	def test_return_Ipn_class
		ipn = KPaypal::Ipn.new
		assert_instance_of KPaypal::Ipn, ipn, 'Should return ipn object'
	end
end