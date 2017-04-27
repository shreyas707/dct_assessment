require 'test_helper'

class AppreciationsControllerTest < ActionController::TestCase
  setup do
    @appreciation = appreciations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:appreciations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create appreciation" do
    assert_difference('Appreciation.count') do
      post :create, appreciation: { answer_id: @appreciation.answer_id, title: @appreciation.title }
    end

    assert_redirected_to appreciation_path(assigns(:appreciation))
  end

  test "should show appreciation" do
    get :show, id: @appreciation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @appreciation
    assert_response :success
  end

  test "should update appreciation" do
    patch :update, id: @appreciation, appreciation: { answer_id: @appreciation.answer_id, title: @appreciation.title }
    assert_redirected_to appreciation_path(assigns(:appreciation))
  end

  test "should destroy appreciation" do
    assert_difference('Appreciation.count', -1) do
      delete :destroy, id: @appreciation
    end

    assert_redirected_to appreciations_path
  end
end
