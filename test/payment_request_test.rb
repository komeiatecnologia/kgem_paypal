require "test/unit"
require "k_paypal"

class PaymentRequestTest < Test::Unit::TestCase
	def test_return_payment_request_class
		payment = KPaypal::PaymentRequest.new
		assert_instance_of KPaypal::PaymentRequest, payment, 'Should return KPaypal::PaymentRequest object'
	end

	def test_set_items
  	payment = KPaypal::PaymentRequest.new
  	assert_instance_of KPaypal::Items, payment.items, 'Should return items object in payment object'
  end

  def test_payment_method_attributes
  	payment = KPaypal::PaymentRequest.new
  	payment.method = 'SetExpressCheckout'
  	payment.order_id = 1
  	payment.total_amount = 100
  	payment.total_amount_items = 100
  	payment.shipping_amount = 10
  	payment.return_url = 'http://teste.com.br/return'
  	payment.cancel_url = 'http://teste.com.br/cancel'
  	assert_equal 'SetExpressCheckout', payment.method, 'Should be SetExpressCheckout'
  	assert_equal 1, payment.order_id, 'Should be 1'
  	assert_equal 100, payment.total_amount, 'Should be 100'
  	assert_equal 100, payment.total_amount_items, 'Should be 100'
  	assert_equal 10, payment.shipping_amount, 'Should be 10'
  	assert_equal 'http://teste.com.br/return', payment.return_url, 'Should be http://teste.com.br/return'
  	assert_equal 'http://teste.com.br/cancel', payment.cancel_url, 'Should be http://teste.com.br/cancel'
  end

  def test_set_express_checkout
  	# KPaypal.test_configure
  	# KPaypal.by_items = true
  	# payment = KPaypal::PaymentRequest.new
  	# payment.order_id = 4
  	# payment.total_amount = 10
  	# payment.total_amount_items = 8
  	# payment.shipping_amount = 2
  	# payment.return_url = 'http://teste.com.br/return'
  	# payment.cancel_url = 'http://teste.com.br/cancel'
  	# payment.items << {
  	# 	:name => 'Produto A',
  	# 	:amount => 3
  	# }
  	# payment.items << {
  	# 	:name => 'Produto B',
  	# 	:amount => 5
  	# }
  	# transaction = payment.set_express_checkout
   #  puts
   #  puts transaction.set_express_checkout.ack
   #  case transaction.set_express_checkout.ack
   #  when 'Success'
   #    puts transaction.set_express_checkout.token
   #    puts transaction.set_express_checkout.time_stamp
   #    puts transaction.set_express_checkout.correlation_id
   #    puts transaction.set_express_checkout.build
   #    puts payment.get_url(transaction.set_express_checkout.token) if transaction.set_express_checkout.ack == 'Success'
   #  when 'Failure'
   #    puts transaction.errors.correlation_id
   #    puts transaction.errors.time_stamp
   #    puts transaction.errors.build
   #    puts transaction.errors.l_error_code
   #    puts transaction.errors.l_short_message
   #    puts transaction.errors.l_long_message
   #  end
  end

  def test_do_express_checkout_payment
  	# KPaypal.test_configure
  	# KPaypal.by_items = true
  	# payment = KPaypal::PaymentRequest.new
  	# payment.order_id = 4
  	# payment.total_amount = 10
  	# payment.total_amount_items = 8
  	# payment.shipping_amount = 2
  	# payment.items << {
  	# 	:name => 'Produto A',
  	# 	:amount => 3
  	# }
  	# payment.items << {
  	# 	:name => 'Produto B',
  	# 	:amount => 5
  	# }
  	# payment.token = 'EC-4UX736141V353923T'
  	# payment.payer_id = '5MQ9PAV43NEA2'
   #  payment.notify_url = 'http://teste.com.br/notify'
  	# transaction = payment.do_express_checkout_payment
  	# puts
   #  puts transaction.do_express_checkout.ack
   #  case transaction.do_express_checkout.ack
   #  when 'Success'
   #    puts transaction.do_express_checkout.token
   #    puts transaction.do_express_checkout.time_stamp
   #    puts transaction.do_express_checkout.correlation_id
   #    puts transaction.do_express_checkout.build
   #    puts transaction.do_express_checkout.payment_info_transaction_id
   #    puts transaction.do_express_checkout.payment_info_payment_type
   #    puts transaction.do_express_checkout.payment_info_payment_status
   #    puts transaction.do_express_checkout.payment_info_pending_reason
   #    puts transaction.do_express_checkout.payment_info_reason_code
   #    puts transaction.do_express_checkout.payment_info_error_code
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