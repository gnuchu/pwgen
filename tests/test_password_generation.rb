require "./lib/PasswordGenerator.rb"
require "test/unit"

class TestPasswordGenerator < Test::Unit::TestCase

  def test_instantiation
    p = PasswordGenerator.new()
    assert_equal(p.class, PasswordGenerator)
  end

  def test_no_2_passwords_the_same
    p = PasswordGenerator.new()
    10000.times do
      password1 = p.generate
      password2 = p.generate
      assert_not_equal(password1, password2)
    end
  end

  def test_returns_string
    p = PasswordGenerator.new()
    assert_equal(p.generate.class, String)
  end

  def test_returns_password_of_correct_length
    p = PasswordGenerator.new(length: 50)
    assert_equal(p.generate.size, 50)
  end

  def test_doesnt_contain_lower
    p = PasswordGenerator.new(lower: false)
    assert_true((p.generate.split(//) & p.lowercase).empty?)
  end
  
  def test_doesnt_contain_upper
    p = PasswordGenerator.new(upper: false)
    assert_true((p.generate.split(//) & p.uppercase).empty?)
  end
  
  def test_doesnt_contain_numbers
    p = PasswordGenerator.new(numbers: false)
    assert_true((p.generate.split(//) & p.numberchars).empty?)
  end
  
  def test_doesnt_contain_special
    p = PasswordGenerator.new(special: false)
    assert_true((p.generate.split(//) & p.specialchars).empty?)
  end
end