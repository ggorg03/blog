require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  setup do
    @category = Category.new
  end

  test "Category can be created" do
    @category.name = "Sports"
    assert @category.valid?
  end

  test "Category name is presence" do
    assert_not @category.valid?
  end

  test "Category name can not be empty string" do
    @category.name = ''
    assert_not @category.valid?
  end

  test "Category name can not be blank string" do
    @category.name = ' '
    assert_not @category.valid?
  end

  test "Category name has to be unique" do
    @category2 = Category.create(name: 'Sports')
    @category.name = 'Sports' 
    assert_not @category.valid?
  end

  test "Category name can't be too long" do
    @category.name = 'a' * 26
    assert_not @category.valid?
  end

  test "Category name can't be too short" do
    @category.name = 'a' * 2
    assert_not @category.valid?
  end

  test "Category with name of 3 caracthers must be valid" do
    @category.name = 'a' * 3
    assert @category.valid?
  end

  test "Category with name of 25 caracthers must be valid" do
    @category.name = 'a' * 25
    assert @category.valid?
  end
end
