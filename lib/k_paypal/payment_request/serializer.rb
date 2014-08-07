module KPaypal
  class PaymentRequest
    class Serializer
      # The payment request that will be serialized.
      attr_reader :payment_request

      def initialize(payment_request)
        @payment_request = payment_request
      end

      def to_params
        params[:USER] = KPaypal.user
        params[:PWD] = KPaypal.pwd
        params[:SIGNATURE] = KPaypal.signature
        params[:VERSION] = KPaypal.version
        params[:METHOD] = payment_request.method
        params[:RETURNURL] = payment_request.return_url
        params[:CANCELURL] = payment_request.cancel_url
        params[:PAYERID] = payment_request.payer_id
        params[:TOKEN] = payment_request.token
        params[:PAYMENTREQUEST_0_PAYMENTACTION] = 'SALE'
        params[:PAYMENTREQUEST_0_AMT] = to_amount(payment_request.total_amount)
        params[:PAYMENTREQUEST_0_CURRENCYCODE] = KPaypal.currency_code
        params[:PAYMENTREQUEST_0_INVNUM] = payment_request.order_id
        params[:HDRIMG] = payment_request.hdr_img
        params[:NOTIFYURL] = payment_request.notify_url
        if KPaypal.by_items
          payment_request.items.each_with_index do |item, index|
            serialize_item_by_items(item, index)
          end
          params[:PAYMENTREQUEST_0_ITEMAMT] = to_amount(payment_request.total_amount_items)
          params[:PAYMENTREQUEST_0_SHIPPINGAMT] = to_amount(payment_request.shipping_amount)
        else
          serialize_item_by_lote(payment_request)
        end
        params.delete_if {|key, value| value.nil? }
        params
      end

      private
      def params
        @params ||= {}
      end

      def serialize_item_by_items(item, index)
        params[:"L_PAYMENTREQUEST_0_NAME#{index}"] = item.name
        params[:"L_PAYMENTREQUEST_0_DESC#{index}"] = item.description
        params[:"L_PAYMENTREQUEST_0_AMT#{index}"] = to_amount(item.amount)
        params[:"L_PAYMENTREQUEST_0_QTY#{index}"] = item.quantity
        params[:"L_PAYMENTREQUEST_0_NUMBER#{index}"] = item.number
      end

      def serialize_item_by_lote(payment_request)
        params[:"L_PAYMENTREQUEST_0_NAME0"] = "Pedido #{payment_request.order_id}"
        params[:"L_PAYMENTREQUEST_0_AMT0"] = to_amount(payment_request.total_amount)
        params[:"L_PAYMENTREQUEST_0_QTY0"] = 1
        params[:"L_PAYMENTREQUEST_0_NUMBER0"] = payment_request.order_id
      end

      def to_amount(amount)
        "%.2f" % BigDecimal(amount.to_s).round(2).to_s("F") if amount
      end
    end
  end
end
