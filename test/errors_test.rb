require 'test/unit'
require 'k_paypal'

class ErrorsTest < Test::Unit::TestCase
	def test_return_Errors_class
		errors = KPaypal::Errors.new
		assert_instance_of KPaypal::Errors, errors, 'Should return errors object'
	end
end