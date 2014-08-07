require "test/unit"
require "k_paypal"

class KPaypalTest < Test::Unit::TestCase
  def test_configuration
    KPaypal.test_configure
    assert_equal 'gerencia-facilitator_api1.komeia.com', KPaypal.user, 'Should be gerencia-facilitator_api1.komeia.com'
    assert_equal '1405688742', KPaypal.pwd, 'Should be 1405688742'
    assert_equal 'AFcWxV21C7fd0v3bYYYRCpSSRl31AUtcmSfICNQxiF-Bi2rQ7Srhc8tF', KPaypal.signature, 'Should be AFcWxV21C7fd0v3bYYYRCpSSRl31AUtcmSfICNQxiF-Bi2rQ7Srhc8tF'
    assert_equal 'BRL', KPaypal.currency_code, 'Should be BRL'
    assert_equal 115, KPaypal.version, 'Should be 115'
    assert_equal false, KPaypal.by_items, 'Should be false'
    assert_equal 'sandbox', KPaypal.mode, 'Should be sandbox'
  end
end