require 'test_helper'

class OutcomeCategoriesControllerTest < ActionController::TestCase
  setup do
    @outcome_category = outcome_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:outcome_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create outcome_category" do
    assert_difference('OutcomeCategory.count') do
      post :create, outcome_category: { name: @outcome_category.name }
    end

    assert_redirected_to outcome_category_path(assigns(:outcome_category))
  end

  test "should show outcome_category" do
    get :show, id: @outcome_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @outcome_category
    assert_response :success
  end

  test "should update outcome_category" do
    patch :update, id: @outcome_category, outcome_category: { name: @outcome_category.name }
    assert_redirected_to outcome_category_path(assigns(:outcome_category))
  end

  test "should destroy outcome_category" do
    assert_difference('OutcomeCategory.count', -1) do
      delete :destroy, id: @outcome_category
    end

    assert_redirected_to outcome_categories_path
  end
end
