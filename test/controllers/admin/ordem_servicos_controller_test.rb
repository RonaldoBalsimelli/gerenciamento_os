require "test_helper"

class Admin::OrdemServicosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_ordem_servicos_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_ordem_servicos_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_ordem_servicos_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_ordem_servicos_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_ordem_servicos_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_ordem_servicos_destroy_url
    assert_response :success
  end
end
