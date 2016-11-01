require 'test_helper'

class SubunitRentsControllerTest < ActionController::TestCase
  setup do
    @subunit_rent = subunit_rents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subunit_rents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subunit_rent" do
    assert_difference('SubunitRent.count') do
      post :create, subunit_rent: { amoun: @subunit_rent.amoun, payed: @subunit_rent.payed, subunit_id: @subunit_rent.subunit_id }
    end

    assert_redirected_to subunit_rent_path(assigns(:subunit_rent))
  end

  test "should show subunit_rent" do
    get :show, id: @subunit_rent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subunit_rent
    assert_response :success
  end

  test "should update subunit_rent" do
    patch :update, id: @subunit_rent, subunit_rent: { amoun: @subunit_rent.amoun, payed: @subunit_rent.payed, subunit_id: @subunit_rent.subunit_id }
    assert_redirected_to subunit_rent_path(assigns(:subunit_rent))
  end

  test "should destroy subunit_rent" do
    assert_difference('SubunitRent.count', -1) do
      delete :destroy, id: @subunit_rent
    end

    assert_redirected_to subunit_rents_path
  end
end
