require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest

  def setup
    @category = Category.create(name: 'sports')
    @category2 = Category.create(name: 'programming')
  end

  test 'should show categories listing' do
    # go to catergory path
    get categories_path
    # check the template for index will be there
    assert_template 'categories/index'
    # check that the link is to the category path and has the categories name
    assert_select 'a[href=?]', category_path(@category), text: @category.name
    assert_select 'a[href=?]', category_path(@category2), text: @category2.name
  end
end
