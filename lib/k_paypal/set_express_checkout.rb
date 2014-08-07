module KPaypal
	class SetExpressCheckout
		include Extensions::MassAssignment

		attr_accessor :token
		attr_accessor :time_stamp
		attr_accessor :correlation_id
		attr_accessor :ack
		attr_accessor :build
	end
end