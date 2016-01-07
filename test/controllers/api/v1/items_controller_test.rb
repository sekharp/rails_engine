require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase
  test '#index returns all items' do
    get :index, format: :json
    assert_response :success
  end

  test '#show responds to json' do
    item = Item.first
    get :show, format: :json, id: Item.first.id

    assert_response :success
    assert_equal "MyString", item[:name]
  end

  test '#find responds with the correct item' do
    item = Item.first
    get :find, format: :json, id: item.id

    assert_response :success
    assert_kind_of Hash, json_response
  end

  test '#find_all responds with all items' do
    get :find_all, format: :json
    assert_response :success
    assert_kind_of Array, json_response
  end

  test '#random' do
    get :random, format: :json

    invoice = json_response

    assert_not_nil(invoice, failure_message = nil)
  end
end
