require 'test_helper'

class WaterReadingsControllerTest < ActionController::TestCase
  setup do
    @water_reading = water_readings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:water_readings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create water_reading" do
    assert_difference('WaterReading.count') do
      post :create, water_reading: { period: @water_reading.period, property_id: @water_reading.property_id, subunit_id: @water_reading.subunit_id, total_reading: @water_reading.total_reading }
    end

    assert_redirected_to water_reading_path(assigns(:water_reading))
  end

  test "should show water_reading" do
    get :show, id: @water_reading
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @water_reading
    assert_response :success
  end

  test "should update water_reading" do
    patch :update, id: @water_reading, water_reading: { period: @water_reading.period, property_id: @water_reading.property_id, subunit_id: @water_reading.subunit_id, total_reading: @water_reading.total_reading }
    assert_redirected_to water_reading_path(assigns(:water_reading))
  end

  test "should destroy water_reading" do
    assert_difference('WaterReading.count', -1) do
      delete :destroy, id: @water_reading
    end

    assert_redirected_to water_readings_path
  end
end
