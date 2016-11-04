require 'test_helper'

class RentPaymentsControllerTest < ActionController::TestCase
  setup do
    @rent_payment = rent_payments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rent_payments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rent_payment" do
    assert_difference('RentPayment.count') do
      post :create, rent_payment: { amount: @rent_payment.amount, payment_method_id: @rent_payment.payment_method_id, receipt_number: @rent_payment.receipt_number, renter_id: @rent_payment.renter_id, subunit_id: @rent_payment.subunit_id, subunit_rent_id: @rent_payment.subunit_rent_id }
    end

    assert_redirected_to rent_payment_path(assigns(:rent_payment))
  end

  test "should show rent_payment" do
    get :show, id: @rent_payment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rent_payment
    assert_response :success
  end

  test "should update rent_payment" do
    patch :update, id: @rent_payment, rent_payment: { amount: @rent_payment.amount, payment_method_id: @rent_payment.payment_method_id, receipt_number: @rent_payment.receipt_number, renter_id: @rent_payment.renter_id, subunit_id: @rent_payment.subunit_id, subunit_rent_id: @rent_payment.subunit_rent_id }
    assert_redirected_to rent_payment_path(assigns(:rent_payment))
  end

  test "should destroy rent_payment" do
    assert_difference('RentPayment.count', -1) do
      delete :destroy, id: @rent_payment
    end

    assert_redirected_to rent_payments_path
  end
end
