require 'test_helper'

class CoffeeshopsControllerTest < ActionController::TestCase
  setup do
    @coffeeshop = coffeeshops(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coffeeshops)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create coffeeshop" do
    assert_difference('Coffeeshop.count') do
      post :create, coffeeshop: { address: @coffeeshop.address, description: @coffeeshop.description, latitude: @coffeeshop.latitude, longitude: @coffeeshop.longitude, name: @coffeeshop.name, picture: @coffeeshop.picture, user_id: @coffeeshop.user_id }
    end

    assert_redirected_to coffeeshop_path(assigns(:coffeeshop))
  end

  test "should show coffeeshop" do
    get :show, id: @coffeeshop
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @coffeeshop
    assert_response :success
  end

  test "should update coffeeshop" do
    patch :update, id: @coffeeshop, coffeeshop: { address: @coffeeshop.address, description: @coffeeshop.description, latitude: @coffeeshop.latitude, longitude: @coffeeshop.longitude, name: @coffeeshop.name, picture: @coffeeshop.picture, user_id: @coffeeshop.user_id }
    assert_redirected_to coffeeshop_path(assigns(:coffeeshop))
  end

  test "should destroy coffeeshop" do
    assert_difference('Coffeeshop.count', -1) do
      delete :destroy, id: @coffeeshop
    end

    assert_redirected_to coffeeshops_path
  end
end
