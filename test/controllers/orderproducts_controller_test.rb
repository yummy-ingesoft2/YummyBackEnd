require 'test_helper'

class OrderproductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @orderproduct = orderproducts(:one)
  end

  test "should get index" do
    get orderproducts_url, as: :json
    assert_response :success
  end

  test "should create orderproduct" do
    assert_difference('Orderproduct.count') do
      post orderproducts_url, params: { orderproduct: { cost: @orderproduct.cost, order_id: @orderproduct.order_id, product_id: @orderproduct.product_id, quantity: @orderproduct.quantity } }, as: :json
    end

    assert_response 201
  end

  test "should show orderproduct" do
    get orderproduct_url(@orderproduct), as: :json
    assert_response :success
  end

  test "should update orderproduct" do
    patch orderproduct_url(@orderproduct), params: { orderproduct: { cost: @orderproduct.cost, order_id: @orderproduct.order_id, product_id: @orderproduct.product_id, quantity: @orderproduct.quantity } }, as: :json
    assert_response 200
  end

  test "should destroy orderproduct" do
    assert_difference('Orderproduct.count', -1) do
      delete orderproduct_url(@orderproduct), as: :json
    end

    assert_response 204
  end
end
