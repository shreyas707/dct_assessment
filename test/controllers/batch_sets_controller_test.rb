require 'test_helper'

class BatchSetsControllerTest < ActionController::TestCase
  setup do
    @batch_set = batch_sets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:batch_sets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create batch_set" do
    assert_difference('BatchSet.count') do
      post :create, batch_set: { batch_id: @batch_set.batch_id, set_date: @batch_set.set_date }
    end

    assert_redirected_to batch_set_path(assigns(:batch_set))
  end

  test "should show batch_set" do
    get :show, id: @batch_set
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @batch_set
    assert_response :success
  end

  test "should update batch_set" do
    patch :update, id: @batch_set, batch_set: { batch_id: @batch_set.batch_id, set_date: @batch_set.set_date }
    assert_redirected_to batch_set_path(assigns(:batch_set))
  end

  test "should destroy batch_set" do
    assert_difference('BatchSet.count', -1) do
      delete :destroy, id: @batch_set
    end

    assert_redirected_to batch_sets_path
  end
end
