require 'test_helper'

class GoodsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get goods_index_url
    assert_response :success
  end

  test "should get search" do
    get goods_search_url
    assert_response :success
  end

  test "should get show" do
    get goods_show_url
    assert_response :success
  end

  test "should get admin_index" do
    get goods_admin_index_url
    assert_response :success
  end

  test "should get admin_show" do
    get goods_admin_show_url
    assert_response :success
  end

  test "should get admin_new" do
    get goods_admin_new_url
    assert_response :success
  end

  test "should get admin_create" do
    get goods_admin_create_url
    assert_response :success
  end

  test "should get admin_destroy" do
    get goods_admin_destroy_url
    assert_response :success
  end

  test "should get admin_edit" do
    get goods_admin_edit_url
    assert_response :success
  end

  test "should get admin_update" do
    get goods_admin_update_url
    assert_response :success
  end

end
