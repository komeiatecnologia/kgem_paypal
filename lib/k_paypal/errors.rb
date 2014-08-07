module KPaypal
	class Errors
		include Extensions::MassAssignment

		attr_accessor :correlation_id
    attr_accessor :time_stamp
    attr_accessor :ack
    attr_accessor :build
    attr_accessor :l_error_code
    attr_accessor :l_short_message
    attr_accessor :l_long_message
	end
end