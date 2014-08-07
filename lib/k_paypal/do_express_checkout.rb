module KPaypal
	class DoExpressCheckout
		include Extensions::MassAssignment

		attr_accessor :token
		attr_accessor :time_stamp
		attr_accessor :correlation_id
		attr_accessor :ack
		attr_accessor :build
		attr_accessor :payment_info_transaction_id
		attr_accessor :payment_info_transaction_type
		attr_accessor :payment_info_payment_type
		attr_accessor :payment_info_order_time
		attr_accessor :payment_info_amt
		attr_accessor :payment_info_fee_amt
		attr_accessor :payment_info_settle_amt
		attr_accessor :payment_info_tax_amt
		attr_accessor :payment_info_currency_code
		attr_accessor :payment_info_exchange_rate
		attr_accessor :payment_info_payment_status
		attr_accessor :payment_info_pending_reason
		attr_accessor :payment_info_reason_code
		attr_accessor :payment_info_protection_elegibility
		attr_accessor :payment_info_protection_elegibility_type
		attr_accessor :payment_info_secure_merchant_account_id
		attr_accessor :payment_info_error_code
		attr_accessor :payment_info_ack
	end
end