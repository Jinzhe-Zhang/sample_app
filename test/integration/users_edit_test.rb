require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end
  test "unseccesssful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: {user: {name: "", email: "I_hate_Jerry@123", password: "foo", password_confirmation: "bar"}}
    assert_template 'users/edit'
  end
  test "successful edit with friendly forwarding" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_url(@user)
    patch user_path(@user), params: {user: {name: "Tom", email: "I_hate_Jerry@123.com", password: "", password_confirmation: ""}}
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal "Tom", @user.name
    assert_equal "I_hate_Jerry@123.com".downcase, @user.email

  end
end
