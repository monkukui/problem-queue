require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User",
                     email: "user@example.com",
                     password: "foobar",
                     password_confirmation: "foobar"
                    )
  end

  test "should be valid" do
    assert @user.valid? # user の validation を呼ぶ
  end

  # ユーザーネームの存在性（presence）
  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end

  # メールアドレスの存在性（presence）
  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  # ユーザーネームの長さ（length）
  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  # メールアドレスの長さ（length）
  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  # メールアドレスのフォーマット（format）
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[hoge.example,com hoge_huga_piyo.org hoge.huga@example. abcde]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  # メールアドレスの存在性（uniquness）
  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  # パスワードの存在性（presence）
  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = "" * 6
    assert_not @user.valid?
  end

  # パスワードの長さ（length）
  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end
