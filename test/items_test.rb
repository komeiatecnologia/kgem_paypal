require 'test/unit'
require 'k_paypal'

class ItemsTest < Test::Unit::TestCase
	def test_return_items_class
		items = KPaypal::Items.new
		assert_instance_of KPaypal::Items, items, 'Should return items object'
	end

	def test_return_2_object_item
		items = KPaypal::Items.new
		2.times do |i|
			item = KPaypal::Item.new(:name => "Produto #{i+1}")
			items << item
		end
		assert_equal 2, items.size, 'Should return 2 objects item'
	end
end