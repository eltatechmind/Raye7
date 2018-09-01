require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", phone: "9999999999", role: "Driver", password: "foobar", password_confirmation: "foobar")
  end

  test "role should be valid" do
    assert @user.valid?
    @user.role = "Passenger"
    assert @user.valid?
  end

  test "name should not be valid" do
  	@user.name = "a" * 51
  	assert !@user.valid?
  	@user.name = ""
  	assert !@user.valid?
  	@user.name = "Example User"
  end

  test "phone should not be valid" do
  	duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  	@user.phone = "12345"
  	assert !@user.valid?
  	@user.phone = ""
  	assert !@user.valid?
  	@user.phone = "12345678912"
  	assert !@user.valid?
  	@user.phone = "1273737878"
  end

  test "role should not be valid" do
  	@user.role = "Dri"
  	assert !@user.valid?
  	@user.role = ""
  	assert !@user.valid?
    @user.role = "Driver"
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
