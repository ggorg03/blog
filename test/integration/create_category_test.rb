require 'test_helper'

class CreateCategoryTest < ActionDispatch::IntegrationTest
  test "can create a category" do
    get new_category_path
    assert_response :success

    assert_difference('Category.count', 1) do
      post categories_path, params: {category: {name: "Sports"}}
    end
    assert_response :redirect
    
    follow_redirect!
    assert_response :success
    
    assert_match 'Category: Sports', @response.body
  end
end