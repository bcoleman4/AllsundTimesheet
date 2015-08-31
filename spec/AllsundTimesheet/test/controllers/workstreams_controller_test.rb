require 'test_helper'

class WorkstreamsControllerTest < ActionController::TestCase
  setup do
    @workstream = workstreams(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:workstreams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create workstream" do
    assert_difference('Workstream.count') do
      post :create, workstream: { name: @workstream.name, notes: @workstream.notes }
    end

    assert_redirected_to workstream_path(assigns(:workstream))
  end

  test "should show workstream" do
    get :show, id: @workstream
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @workstream
    assert_response :success
  end

  test "should update workstream" do
    patch :update, id: @workstream, workstream: { name: @workstream.name, notes: @workstream.notes }
    assert_redirected_to workstream_path(assigns(:workstream))
  end

  test "should destroy workstream" do
    assert_difference('Workstream.count', -1) do
      delete :destroy, id: @workstream
    end

    assert_redirected_to workstreams_path
  end
end
