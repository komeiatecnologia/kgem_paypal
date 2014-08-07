require 'test/unit'
require 'k_paypal'

class SetExpressCheckoutTest < Test::Unit::TestCase
	def test_return_do_express_checkout_class
		set_express_checkout = KPaypal::SetExpressCheckout.new
		assert_instance_of KPaypal::SetExpressCheckout, set_express_checkout, 'Should return set_express_checkout object'
	end
end