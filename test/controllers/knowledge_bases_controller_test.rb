require 'test_helper'

class KnowledgeBasesControllerTest < ActionController::TestCase
  setup do
    @knowledge_basis = knowledge_bases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:knowledge_bases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create knowledge_basis" do
    assert_difference('KnowledgeBase.count') do
      post :create, knowledge_basis: { body: @knowledge_basis.body, chapter_id: @knowledge_basis.chapter_id, is_private: @knowledge_basis.is_private, published: @knowledge_basis.published, title: @knowledge_basis.title, topic_id: @knowledge_basis.topic_id, user_id: @knowledge_basis.user_id }
    end

    assert_redirected_to knowledge_basis_path(assigns(:knowledge_basis))
  end

  test "should show knowledge_basis" do
    get :show, id: @knowledge_basis
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @knowledge_basis
    assert_response :success
  end

  test "should update knowledge_basis" do
    patch :update, id: @knowledge_basis, knowledge_basis: { body: @knowledge_basis.body, chapter_id: @knowledge_basis.chapter_id, is_private: @knowledge_basis.is_private, published: @knowledge_basis.published, title: @knowledge_basis.title, topic_id: @knowledge_basis.topic_id, user_id: @knowledge_basis.user_id }
    assert_redirected_to knowledge_basis_path(assigns(:knowledge_basis))
  end

  test "should destroy knowledge_basis" do
    assert_difference('KnowledgeBase.count', -1) do
      delete :destroy, id: @knowledge_basis
    end

    assert_redirected_to knowledge_bases_path
  end
end
