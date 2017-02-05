require 'test_helper'

class BankAccountTypesControllerTest < ActionController::TestCase
  setup do
    @bank_account_type = bank_account_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bank_account_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bank_account_type" do
    assert_difference('BankAccountType.count') do
      post :create, bank_account_type: { name: @bank_account_type.name }
    end

    assert_redirected_to bank_account_type_path(assigns(:bank_account_type))
  end

  test "should show bank_account_type" do
    get :show, id: @bank_account_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bank_account_type
    assert_response :success
  end

  test "should update bank_account_type" do
    patch :update, id: @bank_account_type, bank_account_type: { name: @bank_account_type.name }
    assert_redirected_to bank_account_type_path(assigns(:bank_account_type))
  end

  test "should destroy bank_account_type" do
    assert_difference('BankAccountType.count', -1) do
      delete :destroy, id: @bank_account_type
    end

    assert_redirected_to bank_account_types_path
  end
end
