require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "Category can be created" do
    @category = Category.new(name: "Sports")
    assert @category.save
  end
end
