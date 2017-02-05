require 'test_helper'

class ElectricityReadingsControllerTest < ActionController::TestCase
  setup do
    @electricity_reading = electricity_readings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:electricity_readings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create electricity_reading" do
    assert_difference('ElectricityReading.count') do
      post :create, electricity_reading: { period: @electricity_reading.period, property_id: @electricity_reading.property_id, subunit_id: @electricity_reading.subunit_id, total_reading: @electricity_reading.total_reading }
    end

    assert_redirected_to electricity_reading_path(assigns(:electricity_reading))
  end

  test "should show electricity_reading" do
    get :show, id: @electricity_reading
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @electricity_reading
    assert_response :success
  end

  test "should update electricity_reading" do
    patch :update, id: @electricity_reading, electricity_reading: { period: @electricity_reading.period, property_id: @electricity_reading.property_id, subunit_id: @electricity_reading.subunit_id, total_reading: @electricity_reading.total_reading }
    assert_redirected_to electricity_reading_path(assigns(:electricity_reading))
  end

  test "should destroy electricity_reading" do
    assert_difference('ElectricityReading.count', -1) do
      delete :destroy, id: @electricity_reading
    end

    assert_redirected_to electricity_readings_path
  end
end
