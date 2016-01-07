require 'test_helper'

class Api::V1::MerchantsControllerTest < ActionController::TestCase
  test '#index returns all merchants' do
    get :index, format: :json
    assert_response :success
  end

  test '#show responds to json' do
    merchant = Merchant.first
    get :show, format: :json, id: merchant.id

    assert_response :success
    assert_equal "MyString", merchant[:name]
  end

  test '#find responds with the correct merchant' do
    merchant = Merchant.first
    get :find, format: :json, id: merchant.id

    assert_response :success
    assert_kind_of Hash, json_response
  end

  test '#find_all responds with all merchants' do
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
