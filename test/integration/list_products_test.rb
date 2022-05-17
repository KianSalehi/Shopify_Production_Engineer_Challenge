require "test_helper"

class ListProductsTest < ActionDispatch::IntegrationTest
  def setup
    @product = Product.create(title: "Testing-list", description: "Testing testing testing-list", quantity: 1, weight: 150, city: "Ottawa"  )
    @product2 = Product.create(title: "Testing-list2", description: "Testing testing testing-list2", quantity: 2, weight: 150, city: "Montreal"  )
  end

  test "should show products listing" do
    get '/'
    assert_response :success
    assert_select "form[action=?]", product_path(@product)
    assert_select "form[action=?]", product_path(@product2)
  end
end
