require 'test_helper'

class CreateCategoryTest < ActionDispatch::IntegrationTest
  test "get new create and show category" do
    get new_category_path
    assert_response :success

    assert_difference 'Category.count', 1 do
      post categories_path, params: {category: {name: "Sports"}}
    end
    assert_response :redirect
    
    follow_redirect!
    assert_response :success
    
    assert_match 'Category: Sports', @response.body
  end

  test "get new but not create and show invalid category" do
    get new_category_path
    assert_response :success

    assert_no_difference 'Category.count' do
      post categories_path, params: { category: { name: nil } }
      post categories_path, params: { category: { name: "" } }
      post categories_path, params: { category: { name: " " } }
      post categories_path, params: { category: { name: "a" * 2 } }
      post categories_path, params: { category: { name: "a" * 26 } }
    end
  end
end