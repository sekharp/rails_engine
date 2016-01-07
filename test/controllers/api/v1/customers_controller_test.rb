require 'test_helper'

class Api::V1::CustomersControllerTest < ActionController::TestCase
  test '#index returns all customers' do
    get :index, format: :json
    assert_response :success
  end

  test '#show' do
    customer = Customer.first
    get :show, format: :json, id: customer.id

    assert_response :success
    assert_equal "MyString", customer[:first_name]
    assert_equal "MyString", customer[:last_name]
  end

  test '#find responds with the correct customer' do
    customer = Customer.first
    get :find, format: :json, id: customer.id

    assert_response :success
    assert_kind_of Hash, json_response
  end

  test '#find_all responds with all customers' do
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
