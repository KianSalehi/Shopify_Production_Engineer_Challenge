require "test_helper"

class CreateProductTest < ActionDispatch::IntegrationTest
  test "get new product form and create product" do
    get "/products/new"
    assert_response :success
    assert_difference 'Product.count', 1 do
      post products_path, params: { product: {title: "Testing-create", description: "Testing testing testing-create", quantity: 1, weight: 150, city: "Ottawa"  }}
      assert_response :redirect 
    end
    follow_redirect!
    assert_response :success
    assert_match "Testing-create", response.body
  end
  test "get new product form and reject invalid product submission" do
    get "/products/new"
    assert_response :success
    assert_no_difference 'Product.count' do
      post products_path, params: { product: {title: " ", description: "Testing testing testing-create", quantity: 1, weight: 150, city: "Ottawa"  }}
    end
    assert_match "errors", response.body
    assert_select 'h2.alert-heading'
  end
end
