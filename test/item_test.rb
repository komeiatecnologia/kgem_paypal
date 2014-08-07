require 'test/unit'
require 'k_paypal'

class ItemTest < Test::Unit::TestCase
	def test_return_item_class
		item = KPaypal::Item.new
		assert_instance_of KPaypal::Item, item, 'Should return item object'
	end

	def test_default_values
		item = KPaypal::Item.new
		assert_equal 1, item.quantity, 'Should be 1 quantity'
	end
end