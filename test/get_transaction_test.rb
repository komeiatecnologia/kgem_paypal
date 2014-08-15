require 'test/unit'
require 'k_paypal'

class GetTransactionTest < Test::Unit::TestCase
	def test_return_get_transaction_class
		get_transaction = KPaypal::GetTransaction.new
		assert_instance_of KPaypal::GetTransaction, get_transaction, 'Should return do_express_checkout object'
	end
end