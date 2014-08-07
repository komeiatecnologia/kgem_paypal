require 'test/unit'
require 'k_paypal'

class GetExpressCheckoutTest < Test::Unit::TestCase
	def test_return_do_express_checkout_class
		get_express_checkout = KPaypal::GetExpressCheckout.new
		assert_instance_of KPaypal::GetExpressCheckout, get_express_checkout, 'Should return get_express_checkout object'
	end
end