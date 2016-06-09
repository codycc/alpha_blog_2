require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username: "codycondon3", email: 'codycondon50@gmail.com', password: 'qwerty123' , admin: true)
  end

  test 'get new category form and create category' do
    sign_in_as(@user,'qwerty123')
    # going to new category path
    get new_category_path
    # getting the new form
    assert_template 'categories/new'
    # posting to new form creating new category sports
    assert_difference 'Category.count', 1 do
      post_via_redirect categories_path, category: {name: 'sports'}
    end
    # redirecting to index page
    assert_template 'categories/index'
    # which should have category sports
    assert_match 'sports', response.body
  end

  test 'invalid category submission results in failure' do
    sign_in_as(@user,'qwerty123')
    # going to new category path
    get new_category_path
    # getting the new form
    assert_template 'categories/new'
    # posting to new form creating new category sports
    assert_no_difference 'Category.count' do
      post categories_path, category: {name: ''}
    end
    # redirecting to index page
    assert_template 'categories/new'
    # which should have category sports
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'

  end

  
end
