require 'test_helper'

class SubunitsControllerTest < ActionController::TestCase
  setup do
    @subunit = subunits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subunits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subunit" do
    assert_difference('Subunit.count') do
      post :create, subunit: { lease_startdate: @subunit.lease_startdate, number: @subunit.number, owner_id: @subunit.owner_id, property_type_id: @subunit.property_type_id, rent_value: @subunit.rent_value, renter_id: @subunit.renter_id, square_meters: @subunit.square_meters }
    end

    assert_redirected_to subunit_path(assigns(:subunit))
  end

  test "should show subunit" do
    get :show, id: @subunit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subunit
    assert_response :success
  end

  test "should update subunit" do
    patch :update, id: @subunit, subunit: { lease_startdate: @subunit.lease_startdate, number: @subunit.number, owner_id: @subunit.owner_id, property_type_id: @subunit.property_type_id, rent_value: @subunit.rent_value, renter_id: @subunit.renter_id, square_meters: @subunit.square_meters }
    assert_redirected_to subunit_path(assigns(:subunit))
  end

  test "should destroy subunit" do
    assert_difference('Subunit.count', -1) do
      delete :destroy, id: @subunit
    end

    assert_redirected_to subunits_path
  end
end
