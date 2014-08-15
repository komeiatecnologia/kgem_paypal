module KPaypal
	class GetTransaction
		include Extensions::MassAssignment

		attr_accessor :receiver_business
		attr_accessor :receiver_email
		attr_accessor :receiver_id
		attr_accessor :email
		attr_accessor :payer_id
		attr_accessor :payer_status
		attr_accessor :country_code
		attr_accessor :business
		attr_accessor :time_stamp
		attr_accessor :correlation_id
		attr_accessor :ack
		attr_accessor :first_name
		attr_accessor :last_name
		attr_accessor :transaction_id
		attr_accessor :transaction_type
		attr_accessor :payment_type
		attr_accessor :order_time
		attr_accessor :amt
		attr_accessor :currency_code
		attr_accessor :payment_status
		attr_accessor :pending_reason
		attr_accessor :reason_code
		attr_accessor :protection_eligibility
		attr_accessor :protection_eligibitity_type
		attr_accessor :l_currency_code
		attr_accessor :l_taxable
	end
end