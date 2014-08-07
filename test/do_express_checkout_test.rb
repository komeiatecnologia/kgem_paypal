require 'test/unit'
require 'k_paypal'

class DoExpressCheckoutTest < Test::Unit::TestCase
	def test_return_do_express_checkout_class
		do_express_checkout = KPaypal::DoExpressCheckout.new
		assert_instance_of KPaypal::DoExpressCheckout, do_express_checkout, 'Should return do_express_checkout object'
	end
end