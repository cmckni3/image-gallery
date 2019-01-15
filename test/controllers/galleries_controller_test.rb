require 'test_helper'

class GalleriesControllerTest < ActionController::TestCase
  setup do
    @gallery = galleries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:galleries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gallery" do
    assert_difference('Gallery.count') do
      post :create, params: { gallery: { name: @gallery.name } }
    end

    assert_redirected_to gallery_path(assigns(:gallery))
  end

  test "should show gallery" do
    get :show, params: { id: @gallery }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { id: @gallery }
    assert_response :success
  end

  test "should update gallery" do
    patch :update, params: { id: @gallery, gallery: { name: @gallery.name } }
    assert_redirected_to gallery_path(assigns(:gallery))
  end

  test "should destroy gallery" do
    assert_difference('Gallery.count', -1) do
      delete :destroy, params: { id: @gallery }
    end

    assert_redirected_to galleries_path
  end
end
