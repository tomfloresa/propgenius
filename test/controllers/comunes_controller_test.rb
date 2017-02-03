require 'test_helper'

class ComunesControllerTest < ActionController::TestCase
  setup do
    @comune = comunes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comunes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comune" do
    assert_difference('Comune.count') do
      post :create, comune: { name: @comune.name }
    end

    assert_redirected_to comune_path(assigns(:comune))
  end

  test "should show comune" do
    get :show, id: @comune
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comune
    assert_response :success
  end

  test "should update comune" do
    patch :update, id: @comune, comune: { name: @comune.name }
    assert_redirected_to comune_path(assigns(:comune))
  end

  test "should destroy comune" do
    assert_difference('Comune.count', -1) do
      delete :destroy, id: @comune
    end

    assert_redirected_to comunes_path
  end
end
