# test/test_samba_api.rb
require 'test_helper'

class TestSambaApi < Minitest::Test

  def test_demodulize_class
    klass_name = 'MyEspecialClass::NameClass'
    result = SambaApi.demodulize_class klass_name
    expected_result = 'nameclass'
    assert_equal(result, expected_result)
  end

  def test_demodulize_class_method_no_params
    klass_name_nil = nil
    result = SambaApi.demodulize_class klass_name_nil
    assert_nil(result)
  end
end
