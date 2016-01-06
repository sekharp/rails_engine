require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase
  test '#index returns all items' do
    get :index, format: :json
    assert_response :success
  end

  test '#show responds to json' do
    get :show, format: :json, id: Item.first.id

    assert_response :success
  end

  test '#find responds with an item' do
    get :find, format: :json
    assert_response :success
    assert_kind_of Hash, json_response
  end
end
