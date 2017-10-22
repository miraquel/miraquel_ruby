require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(nama: "Chaidir Ali Assegaf", email: "ading.assegaf2@gmail.com", password: "foobar123", password_confirmation: "foobar123")
  end

  test "user seharusnya valid" do
    assert @user.valid?
  end

  test "nama seharusnya ada" do
    @user.nama = nil
    assert_not @user.valid?
  end

  test "email seharusnya ada" do
    @user.email = nil
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
     end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

end
