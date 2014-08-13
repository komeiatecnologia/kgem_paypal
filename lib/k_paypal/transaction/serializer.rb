module KPaypal
  class Transaction
    class Serializer
      attr_reader :hash

      def initialize(hash)
        @hash = hash
      end

      def serialize
        {}.tap do |data|
          serialize_general(data)
          serialize_address(data)
          serialize_set_express_checkout(data)
          serialize_get_express_checkout(data)
          serialize_do_express_checkout(data)
          serialize_errors(data)
          serialize_ipn(data)
          serialize_get_transaction(data)

          data.delete_if {|key, value| value.nil? }
        end
      end

      def serialize_general(data)
        data[:token] = hash[:TOKEN]
        data[:payer_id] = hash[:PAYERID]
        data[:ack] = hash[:ACK]
        data[:error_code] = hash[:L_ERRORCODE0]
        data[:short_message] = hash[:L_SHORTMESSAGE0]
        data[:long_message] = hash[:L_LONGMESSAGE0]
      end

      def serialize_address(data)
        data[:address] = {
          :street => hash[:SHIPTOSTREET],
          :city => hash[:SHIPTOCITY],
          :state => hash[:SHIPTOSTATE],
          :country => hash[:SHIPTOCOUNTRYCODE],
          :postal_code => hash[:SHIPTOZIP]
        }
      end

      def serialize_set_express_checkout(data)
        data[:set_express_checkout] = {
          :token => hash[:TOKEN],
          :correlation_id => hash[:CORRELATIONID],
          :ack => hash[:ACK],
          :build => hash[:BUILD],
          :time_stamp => Time.parse(hash[:TIMESTAMP].to_s)
        }
      end

      def serialize_get_express_checkout(data)
        data[:get_express_checkout] = {
          :token => hash[:TOKEN],
          :billing_agreement_accepted_status => hash[:BILLINGAGREEMENTACCEPTEDSTATUS],
          :checkout_status => hash[:CHECKOUTSTATUS],
          :time_stamp => Time.parse(hash[:TIMESTAMP].to_s),
          :correlation_id => hash[:CORRELATIONID],
          :ack => hash[:ACK],
          :build => hash[:BUILD],
          :email => hash[:EMAIL],
          :payer_id => hash[:PAYERID],
          :payer_status => hash[:PAYERSTATUS],
          :first_name => hash[:FIRSTNAME],
          :last_name => hash[:LASTNAME],
          :currency_code => hash[:CURRENCYCODE],
          :tax_id => hash[:TAXID],
          :tax_id_type => hash[:TAXIDTYPE],
          :amt => BigDecimal(hash[:AMT].to_s),
          :item_amt => BigDecimal(hash[:ITEMAMT].to_s),
          :shipping_amt => BigDecimal(hash[:SHIPPINGAMT].to_s),
          :handling_amt => BigDecimal(hash[:HANDLINGAMT].to_s),
          :tax_amt => BigDecimal(hash[:TAXAMT].to_s),
          :inv_num => hash[:INVNUM],
          :insurance_amt => BigDecimal(hash[:INSURANCEAMT].to_s),
          :ship_disc_amt => BigDecimal(hash[:SHIPDISCAMT].to_s),
          :payment_request_currency_code => hash[:PAYMENTREQUEST_0_CURRENCYCODE],
          :payment_request_amt =>  BigDecimal(hash[:PAYMENTREQUEST_0_AMT].to_s),
          :payment_request_item_amt => BigDecimal(hash[:PAYMENTREQUEST_0_ITEMAMT].to_s),
          :payment_request_shipping_amt => BigDecimal(hash[:PAYMENTREQUEST_0_SHIPPINGAMT].to_s),
          :payment_request_handling_amt => BigDecimal(hash[:PAYMENTREQUEST_0_HANDLINGAMT].to_s),
          :payment_request_tax_amt => BigDecimal(hash[:PAYMENTREQUEST_0_TAXAMT].to_s),
          :payment_request_inv_num => hash[:PAYMENTREQUEST_0_INVNUM],
          :payment_request_insurance_amt => BigDecimal(hash[:PAYMENTREQUEST_0_INSURANCEAMT].to_s),
          :payment_request_ship_disc_amt => BigDecimal(hash[:PAYMENTREQUEST_0_SHIPDISCAMT].to_s),
          :payment_request_address_normalization_status => hash[:PAYMENTREQUEST_0_ADDRESSNORMALIZATIONSTATUS],
          :payment_request_error_code => hash[:PAYMENTREQUESTINFO_0_ERRORCODE],
          :payment_request_ship_to_name => hash[:PAYMENTREQUEST_0_SHIPTONAME],
          :payment_request_ship_to_street => hash[:PAYMENTREQUEST_0_SHIPTOSTREET],
          :payment_request_ship_to_city => hash[:PAYMENTREQUEST_0_SHIPTOCITY],
          :payment_request_ship_to_state => hash[:PAYMENTREQUEST_0_SHIPTOSTATE],
          :payment_request_ship_to_zip => hash[:PAYMENTREQUEST_0_SHIPTOZIP],
          :payment_request_ship_to_country_code => hash[:PAYMENTREQUEST_0_SHIPTOCOUNTRYCODE],
          :payment_request_ship_to_country_name => hash[:PAYMENTREQUEST_0_SHIPTOCOUNTRYNAME]
        }
      end

      def serialize_do_express_checkout(data)
        data[:do_express_checkout] = {
          :token => hash[:TOKEN],
          :time_stamp => Time.parse(hash[:TIMESTAMP].to_s),
          :correlation_id => hash[:CORRELATIONID],
          :ack => hash[:ACK],
          :build => hash[:BUILD],
          :payment_info_transaction_id => hash[:PAYMENTINFO_0_TRANSACTIONID],
          :payment_info_transaction_type => hash[:PAYMENTINFO_0_TRANSACTIONTYPE],
          :payment_info_payment_type => hash[:PAYMENTINFO_0_PAYMENTTYPE],
          :payment_info_order_time => Time.parse(hash[:PAYMENTINFO_0_ORDERTIME].to_s),
          :payment_info_amt => BigDecimal(hash[:PAYMENTINFO_0_AMT].to_s),
          :payment_info_fee_amt => BigDecimal(hash[:PAYMENTINFO_0_FEEAMT].to_s),
          :payment_info_settle_amt => BigDecimal(hash[:PAYMENTINFO_0_SETTLEAMT].to_s),
          :payment_info_tax_amt => BigDecimal(hash[:PAYMENTINFO_0_TAXAMT].to_s),
          :payment_info_currency_code => hash[:PAYMENTINFO_0_CURRENCYCODE],
          :payment_info_exchange_rate => hash[:PAYMENTINFO_0_EXCHANGERATE],
          :payment_info_payment_status => hash[:PAYMENTINFO_0_PAYMENTSTATUS],
          :payment_info_pending_reason => hash[:PAYMENTINFO_0_PENDINGREASON],
          :payment_info_reason_code => hash[:PAYMENTINFO_0_REASONCODE],
          :payment_info_protection_elegibility => hash[:PAYMENTINFO_0_PROTECTIONELIGIBILITY],
          :payment_info_protection_elegibility_type => hash[:PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE],
          :payment_info_secure_merchant_account_id => hash[:PAYMENTINFO_0_SECUREMERCHANTACCOUNTID],
          :payment_info_error_code => hash[:PAYMENTINFO_0_ERRORCODE],
          :payment_info_ack => hash[:PAYMENTINFO_0_ACK]
        }
      end

      def serialize_errors(data)
        data[:errors] = {
          :correlation_id => hash[:CORRELATIONID],
          :time_stamp => Time.parse(hash[:TIMESTAMP].to_s),
          :ack => hash[:ACK],
          :build => hash[:BUILD],
          :l_error_code => hash[:L_ERRORCODE0],
          :l_short_message => hash[:L_SHORTMESSAGE0],
          :l_long_message => hash[:L_LONGMESSAGE0]
        }
      end

      def serialize_ipn(data)
        data[:ipn] = {
          :residence_country => hash[:residence_country],
          :invoice => hash[:invoice],
          :address_city => hash[:address_city],
          :first_name => hash[:first_name],
          :payer_id => hash[:payer_id],
          :mc_fee => hash[:mc_fee],
          :txn_id => hash[:txn_id],
          :receiver_email => hash[:receiver_email],
          :custom => hash[:custom],
          :payment_date => hash[:payment_date],
          :address_country_code => hash[:address_country_code],
          :address_zip => hash[:address_zip],
          :item_name1 => hash[:item_name1],
          :mc_handling => hash[:mc_handling],
          :mc_handling1 => hash[:mc_handling1],
          :tax => hash[:tax],
          :address_name => hash[:address_name],
          :last_name => hash[:last_name],
          :receiver_id => hash[:receiver_id],
          :verify_sign => hash[:verify_sign],
          :address_country => hash[:address_country],
          :payment_status => hash[:payment_status],
          :address_status => hash[:address_status],
          :business => hash[:business],
          :payer_email => hash[:payer_email],
          :notify_version => hash[:notify_version],
          :txn_type => hash[:txn_type],
          :test_ipn => hash[:test_ipn],
          :payer_status => hash[:payer_status],
          :mc_currency => hash[:mc_currency],
          :mc_gross => hash[:mc_gross],
          :mc_shipping => hash[:mc_shipping],
          :mc_shipping1 => hash[:mc_shipping1],
          :item_number1 => hash[:item_number1],
          :quantity1 => hash[:quantity1],
          :address_state => hash[:address_state],
          :mc_gross1 => hash[:mc_gross1],
          :payment_type => hash[:payment_type],
          :address_street => hash[:address_street]
        }
      end

      def serialize_get_transaction(data)
        data[:get_transaction] = {
          :receiver_business => hash[:RECEIVERBUSINESS],
          :receiver_email => hash[:RECEIVEREMAIL],
          :receiver_id => hash[:RECEIVERID],
          :email => hash[:EMAIL],
          :payer_id => hash[:PAYERID],
          :payer_status => hash[:PAYERSTATUS],
          :country_code => hash[:COUNTRYCODE],
          :business => hash[:BUSINESS],
          :time_stamp => Time.parse(hash[:TIMESTAMP].to_s),
          :correlation_id => hash[:CORRELATIONID],
          :ack => hash[:ACK],
          :first_name => hash[:FIRSTNAME],
          :last_name => hash[:LASTNAME],
          :transaction_id => hash[:TRANSACTIONID],
          :transaction_type => hash[:TRANSACTIONTYPE],
          :payment_type => hash[:PAYMENTTYPE],
          :order_time => Time.parse(hash[:ORDERTIME].to_s),
          :amt => BigDecimal(hash[:AMT].to_s),
          :currency_code => hash[:CURRENCYCODE],
          :payment_status => hash[:PAYMENTSTATUS],
          :pending_reason => hash[:PENDINGREASON],
          :reason_code => hash[:REASONCODE],
          :protection_eligibility => hash[:PROTECTIONELIGIBILITY],
          :protection_eligibitity_type => hash[:PROTECTIONELIGIBILITYTYPE],
          :l_currency_code => hash[:L_CURRENCYCODE0],
          :l_taxable => hash[:L_TAXABLE0]
        }
      end
    end
  end
end