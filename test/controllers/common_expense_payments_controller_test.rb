require 'test_helper'

class CommonExpensePaymentsControllerTest < ActionController::TestCase
  setup do
    @common_expense_payment = common_expense_payments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:common_expense_payments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create common_expense_payment" do
    assert_difference('CommonExpensePayment.count') do
      post :create, common_expense_payment: { amount: @common_expense_payment.amount, common_expense_subunit_id: @common_expense_payment.common_expense_subunit_id, payment_method_id: @common_expense_payment.payment_method_id, receipt_number: @common_expense_payment.receipt_number, renter_id: @common_expense_payment.renter_id, subunit_id: @common_expense_payment.subunit_id }
    end

    assert_redirected_to common_expense_payment_path(assigns(:common_expense_payment))
  end

  test "should show common_expense_payment" do
    get :show, id: @common_expense_payment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @common_expense_payment
    assert_response :success
  end

  test "should update common_expense_payment" do
    patch :update, id: @common_expense_payment, common_expense_payment: { amount: @common_expense_payment.amount, common_expense_subunit_id: @common_expense_payment.common_expense_subunit_id, payment_method_id: @common_expense_payment.payment_method_id, receipt_number: @common_expense_payment.receipt_number, renter_id: @common_expense_payment.renter_id, subunit_id: @common_expense_payment.subunit_id }
    assert_redirected_to common_expense_payment_path(assigns(:common_expense_payment))
  end

  test "should destroy common_expense_payment" do
    assert_difference('CommonExpensePayment.count', -1) do
      delete :destroy, id: @common_expense_payment
    end

    assert_redirected_to common_expense_payments_path
  end
end
