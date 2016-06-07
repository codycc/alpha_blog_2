require 'test_helper'
class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: 'sports')
  end

  test 'category should be valid' do
    assert @category.valid?
  end

  test 'name should be present' do
    # setting the category name to be blank
    @category.name = ''
    # the category should not be valid
    assert_not @category.valid?
  end

  test 'name should be unique' do
    # we are using save because it needs to hit database to see if there is another category with same name
    @category.save
    # creating new category....
    category2 = Category.new(name: 'sports')
    # this category should not be valid
    assert_not category2.valid?
  end

  test 'name should not be too long' do
    # making the name 26 characters
    @category.name = "a" * 26
    # asserting that this name isnt valid
    assert_not @category.valid?

  end

  test 'name should not be too short' do
    # making the name 2 characters
    @category.name = "aa"
    # asserting that this name isnt valid
    assert_not @category.valid?
  end


end
