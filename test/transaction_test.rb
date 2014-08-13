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

  def test_get_transaction_details_object
    transaction = KPaypal::Transaction.new
    transaction.get_transaction = {:transaction_id => 12345678}
    assert_instance_of KPaypal::GetTransaction, transaction.get_transaction, 'Should return get_transaction object in transaction'
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

  def test_get_transaction_details
    # KPaypal.test_configure
    # transaction = KPaypal::Transaction.new
    # transaction.transaction_id = "9XA27794CB0274335"
    # transaction = transaction.get_transaction_details
    # case transaction.get_transaction.ack
    # when 'Success'
    #   puts
    #   puts transaction.get_transaction.receiver_business
    #   puts transaction.get_transaction.receiver_email
    #   puts transaction.get_transaction.receiver_id
    #   puts transaction.get_transaction.email
    #   puts transaction.get_transaction.payer_id
    #   puts transaction.get_transaction.payer_status
    #   puts transaction.get_transaction.country_code
    #   puts transaction.get_transaction.business
    #   puts transaction.get_transaction.time_stamp
    #   puts transaction.get_transaction.correlation_id
    #   puts transaction.get_transaction.ack
    #   puts transaction.get_transaction.first_name
    #   puts transaction.get_transaction.last_name
    #   puts transaction.get_transaction.transaction_id
    #   puts transaction.get_transaction.transaction_type
    #   puts transaction.get_transaction.payment_type
    #   puts transaction.get_transaction.order_time
    #   puts transaction.get_transaction.amt
    #   puts transaction.get_transaction.currency_code
    #   puts transaction.get_transaction.payment_status
    #   puts transaction.get_transaction.pending_reason
    #   puts transaction.get_transaction.reason_code
    #   puts transaction.get_transaction.protection_eligibility
    #   puts transaction.get_transaction.protection_eligibitity_type
    #   puts transaction.get_transaction.l_currency_code
    #   puts transaction.get_transaction.l_taxable
    # when 'Failure'
    #   puts transaction.errors.correlation_id
    #   puts transaction.errors.time_stamp
    #   puts transaction.errors.build
    #   puts transaction.errors.l_error_code
    #   puts transaction.errors.l_short_message
    #   puts transaction.errors.l_long_message
    # end
  end
end