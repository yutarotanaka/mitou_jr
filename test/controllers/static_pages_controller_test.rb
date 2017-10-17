require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get start" do
    get :start
    assert_response :success
  end

  test "should get console" do
    get :console
    assert_response :success
  end

  test "should get help" do
    get :help
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get user_home" do
    get :user_home
    assert_response :success
  end

end
