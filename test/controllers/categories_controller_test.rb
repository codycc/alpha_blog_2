require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  def setup
    @category = Category.create(name: 'sports')
    @user = User.create(username: "codycondon3", email: 'codycondon50@gmail.com', password: 'qwerty123' , admin: true)
  end

  test 'should get categories index'do
    get :index
    assert_response :success
  end

  test 'should get new' do
    session[:user_id] = @user.id
    get :new
    assert_response :success
  end

  test 'should get show' do
    # show needs an idea to be able to actually pass so im passing in the id below
    get(:show, {'id' => @category.id})
    assert_response :success
  end

  test 'should redirect create when admin not logged in' do
    # no difference in the category count when the post create action happens
    assert_no_difference 'Category.count' do
      post :create, category: {name: 'sports'}
    end
    # it should then redirect to the categories path
    assert_redirected_to categories_path
  end

end
