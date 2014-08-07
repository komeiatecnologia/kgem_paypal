module KPaypal
  class Transaction
    include Extensions::MassAssignment
    include Extensions::EnsureType

    attr_accessor :token
    attr_accessor :payer_id
    attr_accessor :ack
    attr_accessor :error_code
    attr_accessor :short_message
    attr_accessor :long_message

    attr_reader :address
    attr_reader :set_express_checkout
    attr_reader :get_express_checkout
    attr_reader :do_express_checkout
    attr_reader :errors
    attr_reader :ipn

    ENDPOINT = {
      :production => 'https://api-3t.paypal.com/nvp?',
      :sandbox => 'https://api-3t.sandbox.paypal.com/nvp?'
    }

    ENDPOINT_IPN = {
      :production => 'https://www.paypal.com/cgi-bin/webscr?cmd=_notify-validate?',
      :sandbox => 'https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_notify-validate?'
    }

    ENDPOINT_TOKEN = {
      :production => 'https://www.paypal.com/cgi-bin/webscr?cmd=_express-checkout&token=',
      :sandbox => 'https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_express-checkout&token='
    }

    def address=(address)
      @address = ensure_type(Address, address)
    end

    def set_express_checkout=(set_express_checkout)
      @set_express_checkout = ensure_type(SetExpressCheckout, set_express_checkout)
    end

    def get_express_checkout=(get_express_checkout)
      @get_express_checkout = ensure_type(GetExpressCheckout, get_express_checkout)
    end

    def do_express_checkout=(do_express_checkout)
      @do_express_checkout = ensure_type(DoExpressCheckout, do_express_checkout)
    end

    def errors=(errors)
      @errors = ensure_type(Errors, errors)
    end

    def ipn=(ipn)
      @ipn = ensure_type(Ipn, ipn)
    end

    def get_url(token)
      "#{ENDPOINT_TOKEN[KPaypal.mode.to_sym]}#{token}"
    end

    #GetExpressCheckoutDetails
    def get_express_checkout_details
      hash = {
        :USER => KPaypal.user,
        :PWD => KPaypal.pwd,
        :SIGNATURE => KPaypal.signature,
        :VERSION => KPaypal.version,
        :METHOD => 'GetExpressCheckoutDetails',
        :TOKEN => self.token
      }
      hash = connect_http_request(to_query(hash))
      Transaction.new(Serializer.new(hash).serialize)
    end

    def get_ipn_attributes(ipn)
      hash = convert_to_hash(ipn)
      Transaction.new(Serializer.new(hash).serialize)
    end

    def validate_ipn(ipn)
      response = connect_http_request_ipn(ipn)
      response && response == 'VERIFIED' ? true : false
    end

    private
    def connect_http_request(params)
      uri = URI.parse(ENDPOINT[KPaypal.mode.to_sym])
      http = Net::HTTP.new(uri.host, uri.port)
      http.read_timeout = 0
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Post.new(uri.request_uri)
      request.body = params
      response = http.request(request)
      puts response.body
      response = convert_to_hash(response.body)
      return response
    end

    def connect_http_request_ipn(params)
      uri = URI.parse(ENDPOINT_IPN[KPaypal.mode.to_sym])
      http = Net::HTTP.new(uri.host, uri.port)
      http.read_timeout = 0
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Post.new(uri.request_uri)
      request.body = params
      response = http.request(request)
      puts response.body
      return response.body
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
        p << "#{k}=#{v}"
      end
      p.join "&"
    end
  end
end