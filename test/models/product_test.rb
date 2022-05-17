require "test_helper"

class ProductTest < ActiveSupport::TestCase
    def setup
        @product = Product.create()
    end
    test "title presence not valid" do
        @product.title = nil
        @product.description = "testing description"
        @product.quantity = 1
        @product.city = "Ottawa"
        assert_not @product.valid?
        @product.title = ""
        assert_not @product.valid?
    end
    test "description presence not valid" do
        @product.title = "testing"
        @product.description = nil
        @product.quantity = 1
        @product.city = "Ottawa"
        assert_not @product.valid?
        @product.description = ""
        assert_not @product.valid?
    end
    test "quantity presence not valid" do
        @product.title = "testing"
        @product.description = "testing description"
        @product.quantity = nil
        @product.city = "Ottawa"
        assert_not @product.valid?
    end
    test "city presence not valid" do
        @product.title = "testing"
        @product.description = "testing description"
        @product.quantity = 1
        @product.city = nil
        assert_not @product.valid?
        @product.city = ""
        assert_not @product.valid?
    end
    test "quantity numericality not valid" do
        @product.title = "testing"
        @product.description = "testing description"
        @product.quantity = "testing"
        @product.city = "Ottawa"
        assert_not @product.valid?
    end
    test "weight numericality not valid" do
        @product.title = "testing"
        @product.description = "testing description"
        @product.quantity = 1
        @product.city = "Ottawa"
        @product.weight = "testing"
        assert_not @product.valid?
    end
    test "title length not valid" do
        @product.title = "a"
        @product.description = "testing description"
        @product.quantity = 1
        @product.city = "Ottawa"
        assert_not @product.valid?
    end
    test "description length not valid" do
        @product.title = "testing"
        @product.description = "b"
        @product.quantity = 1
        @product.city = "Ottawa"
        assert_not @product.valid?
    end
    test "weight allow blank valid" do
        @product.title = "testing"
        @product.description = "testing description"
        @product.quantity = 1
        @product.city = "Ottawa"
        @product.weight = nil
        assert @product.valid?
        @product.weight = ""
        assert @product.valid?
    end
end