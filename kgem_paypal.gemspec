Gem::Specification.new do |s|
	s.name 				  = 'kgem_paypal'
	s.version 		  = '0.0.7'
	s.summary 		  = 'Paypal Express Integration'
	s.description   = 'Paypal API Integration'
	s.author 			  = 'Komeia Interativa'
	s.email 			  = 'ti@komeia.com'
	s.homepage 		  = 'https://developer.paypal.com/webapps/developer/docs/classic/express-checkout/ht_ec-singleItemPayment-curl-etc/'
	s.platform              = Gem::Platform::RUBY
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
	s.files 			  = Dir["{lib/**/*.rb,README.rdoc,test/**/*.rb,Rakefile,*.gemspec}"]
	s.require_paths   = ['lib']
	s.post_install_message = "    **************************************************\n
Rails 2.3.8\n
Tabela para armazenar informações das transações PayPal\n
Criar relação 1..n na tabela Order para PaypalLog\n
script/generate model paypal_log order:references token:string correlation_id:string checkout_status:string payer_id:string transaction_id:string payment_status:string pending_reason:string\n\n

Tabela para armazenar informações do serviço IPN PayPal\n
script/generate model paypal_ipn_log invoice:string receiver_email:string txn_id:string payer_email:string payer_id:string payment_status:string payment_type:string\n\n

Rails >= 3\n
Tabela para armazenar informações das transações PayPal\n
Criar relação 1..n na tabela Order para PaypalLog\n
rails g model paypal_log order:references token:string correlation_id:string checkout_status:string payer_id:string transaction_id:string payment_status:string pending_reason:string\n\n

Tabela para armazenar informações do serviço IPN PayPal\n
rails g model paypal_ipn_log invoice:string receiver_email:string txn_id:string payer_email:string payer_id:string payment_status:string payment_type:string\n    **************************************************"
end