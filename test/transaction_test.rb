require "test/unit"
require "k_paypal"

class TransactionTest < Test::Unit::TestCase
	def test_return_transaction_request_class
		transaction = KPaypal::Transaction.new
		assert_instance_of KPaypal::Transaction, transaction, 'Should return KPaypal::Transaction object'
	end

	def test_address_object
  	transaction = KPaypal::Transaction.new
    transaction.address = {:street => 'teste'}
  	assert_instance_of KPaypal::Address, transaction.address, 'Should return address object in transaction object'
  end

  def test_set_express_checkout_object
    transaction = KPaypal::Transaction.new
    transaction.set_express_checkout = {:token => '123456'}
    assert_instance_of KPaypal::SetExpressCheckout, transaction.set_express_checkout, 'Should return set_express_checkout object in transaction object'
  end

  def test_get_express_checkout_object
    transaction = KPaypal::Transaction.new
    transaction.get_express_checkout = {:token => '123456'}
    assert_instance_of KPaypal::GetExpressCheckout, transaction.get_express_checkout, 'Should return get_express_checkout object in transaction object'
  end

  def test_do_express_checkout_object
    transaction = KPaypal::Transaction.new
    transaction.do_express_checkout = {:token => '123456'}
    assert_instance_of KPaypal::DoExpressCheckout, transaction.do_express_checkout, 'Should return do_express_checkout object in transaction object'
  end

  def test_errors_object
    transaction = KPaypal::Transaction.new
    transaction.errors = {:ack => 'Failure'}
    assert_instance_of KPaypal::Errors, transaction.errors
  end

  def test_ipn_object
    transaction = KPaypal::Transaction.new
    transaction.ipn = {:residence_country => 'BR'}
    assert_instance_of KPaypal::Ipn, transaction.ipn
  end

  def test_transaction_method_attributes
  	transaction = KPaypal::Transaction.new
    transaction.token = 'EC-7A106019FR077445K'
    assert_equal 'EC-7A106019FR077445K', transaction.token, 'Should be EC-7A106019FR077445K'
  end

  def test_get_express_checkout_details
  	# KPaypal.test_configure
  	# transaction = KPaypal::Transaction.new
  	# transaction.token = 'EC-4UX736141V353923T'
  	# transaction = transaction.get_express_checkout_details
   #  puts
   #  puts transaction.get_express_checkout.ack
   #  case transaction.get_express_checkout.ack
   #  when 'Success'
   #    puts transaction.get_express_checkout.billing_agreement_accepted_status
   #    puts transaction.get_express_checkout.checkout_status
   #    puts transaction.get_express_checkout.correlation_id
   #    puts transaction.get_express_checkout.payment_request_error_code
   #    puts transaction.get_express_checkout.email
   #  when 'Failure'
   #    puts transaction.errors.correlation_id
   #    puts transaction.errors.time_stamp
   #    puts transaction.errors.build
   #    puts transaction.errors.l_error_code
   #    puts transaction.errors.l_short_message
   #    puts transaction.errors.l_long_message
   #  end
  end
end