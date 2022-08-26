require 'test_helper'

class ListCategoryTest < ActionDispatch::IntegrationTest

  def setup
      @category = Category.create(name: 'category')
      @category2 = Category.create(name: 'category2')
  end

  test "test categories are listeds" do
    get categories_path
    assert_response :success

    assert_select "a[href=?]", category_path(@category), text: @category.name
    assert_select "a[href=?]", category_path(@category2), text: @category2.name
  end
end
