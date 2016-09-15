require 'test_helper'

class CommonExpensePropertiesControllerTest < ActionController::TestCase
  setup do
    @common_expense_property = common_expense_properties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:common_expense_properties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create common_expense_property" do
    assert_difference('CommonExpenseProperty.count') do
      post :create, common_expense_property: { details: @common_expense_property.details, electricity: @common_expense_property.electricity, gas: @common_expense_property.gas, others: @common_expense_property.others, property_id: @common_expense_property.property_id, water: @common_expense_property.water }
    end

    assert_redirected_to common_expense_property_path(assigns(:common_expense_property))
  end

  test "should show common_expense_property" do
    get :show, id: @common_expense_property
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @common_expense_property
    assert_response :success
  end

  test "should update common_expense_property" do
    patch :update, id: @common_expense_property, common_expense_property: { details: @common_expense_property.details, electricity: @common_expense_property.electricity, gas: @common_expense_property.gas, others: @common_expense_property.others, property_id: @common_expense_property.property_id, water: @common_expense_property.water }
    assert_redirected_to common_expense_property_path(assigns(:common_expense_property))
  end

  test "should destroy common_expense_property" do
    assert_difference('CommonExpenseProperty.count', -1) do
      delete :destroy, id: @common_expense_property
    end

    assert_redirected_to common_expense_properties_path
  end
end
