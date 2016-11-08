require 'test_helper'

class ImportantNumericalValuesControllerTest < ActionController::TestCase
  setup do
    @important_numerical_value = important_numerical_values(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:important_numerical_values)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create important_numerical_value" do
    assert_difference('ImportantNumericalValue.count') do
      post :create, important_numerical_value: { name: @important_numerical_value.name, value: @important_numerical_value.value }
    end

    assert_redirected_to important_numerical_value_path(assigns(:important_numerical_value))
  end

  test "should show important_numerical_value" do
    get :show, id: @important_numerical_value
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @important_numerical_value
    assert_response :success
  end

  test "should update important_numerical_value" do
    patch :update, id: @important_numerical_value, important_numerical_value: { name: @important_numerical_value.name, value: @important_numerical_value.value }
    assert_redirected_to important_numerical_value_path(assigns(:important_numerical_value))
  end

  test "should destroy important_numerical_value" do
    assert_difference('ImportantNumericalValue.count', -1) do
      delete :destroy, id: @important_numerical_value
    end

    assert_redirected_to important_numerical_values_path
  end
end
