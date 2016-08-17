require 'test_helper'

class OperationalSystemsControllerTest < ActionController::TestCase
  setup do
    @operational_system = operational_systems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:operational_systems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create operational_system" do
    assert_difference('OperationalSystem.count') do
      post :create, operational_system: { name: @operational_system.name }
    end

    assert_redirected_to operational_system_path(assigns(:operational_system))
  end

  test "should show operational_system" do
    get :show, id: @operational_system
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @operational_system
    assert_response :success
  end

  test "should update operational_system" do
    patch :update, id: @operational_system, operational_system: { name: @operational_system.name }
    assert_redirected_to operational_system_path(assigns(:operational_system))
  end

  test "should destroy operational_system" do
    assert_difference('OperationalSystem.count', -1) do
      delete :destroy, id: @operational_system
    end

    assert_redirected_to operational_systems_path
  end
end
