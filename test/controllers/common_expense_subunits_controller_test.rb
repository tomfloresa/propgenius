require 'test_helper'

class CommonExpenseSubunitsControllerTest < ActionController::TestCase
  setup do
    @common_expense_subunit = common_expense_subunits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:common_expense_subunits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create common_expense_subunit" do
    assert_difference('CommonExpenseSubunit.count') do
      post :create, common_expense_subunit: { electricity_charge: @common_expense_subunit.electricity_charge, gas_charge: @common_expense_subunit.gas_charge, others_charge: @common_expense_subunit.others_charge, subunit_id: @common_expense_subunit.subunit_id, water_charge: @common_expense_subunit.water_charge }
    end

    assert_redirected_to common_expense_subunit_path(assigns(:common_expense_subunit))
  end

  test "should show common_expense_subunit" do
    get :show, id: @common_expense_subunit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @common_expense_subunit
    assert_response :success
  end

  test "should update common_expense_subunit" do
    patch :update, id: @common_expense_subunit, common_expense_subunit: { electricity_charge: @common_expense_subunit.electricity_charge, gas_charge: @common_expense_subunit.gas_charge, others_charge: @common_expense_subunit.others_charge, subunit_id: @common_expense_subunit.subunit_id, water_charge: @common_expense_subunit.water_charge }
    assert_redirected_to common_expense_subunit_path(assigns(:common_expense_subunit))
  end

  test "should destroy common_expense_subunit" do
    assert_difference('CommonExpenseSubunit.count', -1) do
      delete :destroy, id: @common_expense_subunit
    end

    assert_redirected_to common_expense_subunits_path
  end
end
