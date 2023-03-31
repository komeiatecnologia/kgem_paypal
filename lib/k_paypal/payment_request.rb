module KPaypal
	class PaymentRequest
		include Extensions::MassAssignment
    include Extensions::EnsureType

		attr_accessor :method
		attr_accessor :order_id
		attr_accessor :total_amount
		attr_accessor :total_amount_items
		attr_accessor :shipping_amount
		attr_accessor :return_url
		attr_accessor :cancel_url
		attr_accessor :hdr_img
		attr_accessor :notify_url

		attr_accessor :payer_id
		attr_accessor :token

		ENDPOINT = {
	    :production => 'https://api-3t.paypal.com/nvp?',
	    :sandbox => 'https://api-3t.sandbox.paypal.com/nvp?'
	  }

	  def items
      @items ||= Items.new
    end

    def generate_params
      params = Serializer.new(self).to_params
      params
    end

    #SetExpressCheckout
	  def set_express_checkout
	  	self.method = 'SetExpressCheckout'
	  	hash = connect_http_request(to_query(self.generate_params))
	  	Transaction.new(Transaction::Serializer.new(hash).serialize)
	  end

	  #DoExpressCheckoutPayment
	  def do_express_checkout_payment
	  	self.method = 'DoExpressCheckoutPayment'
	  	hash = connect_http_request(to_query(self.generate_params))
	  	Transaction.new(Transaction::Serializer.new(hash).serialize)
	  end

	  private
	  def connect_http_request(params)
	    uri = URI.parse(ENDPOINT[KPaypal.mode.to_sym])
	    http = Net::HTTP.new(uri.host, uri.port)
	    http.read_timeout = 20
	    http.use_ssl = true
	    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
	    request = Net::HTTP::Post.new(uri.request_uri)
	    request.body = params
	    response = http.request(request)
	    puts response.body
	    response = convert_to_hash(response.body)
	    return response
	  end

	  def convert_to_hash(response)
	  	response = CGI.parse(response).inject({}) do |res, (k, v)|
	  		res.merge!(k.to_sym => v.first)
	  	end
	  	response
	  end

	  def to_query(hash)
	    p = []
	    hash.each do |k,v|
	      p << "#{k}=#{CGI::escape(v.to_s)}"
	    end
	    p.join "&"
	  end
	end
end