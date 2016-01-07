require 'test_helper'

class Api::V1::TransactionsControllerTest < ActionController::TestCase
  test '#index returns all transactions' do
    get :index, format: :json
    assert_response :success
  end

  test '#show responds to json' do
    transaction = Transaction.first
    get :show, format: :json, id: Transaction.first.id

    assert_response :success
    assert_equal "MyString", transaction[:result]
  end

  test '#find responds with the correct transaction' do
    transaction = Transaction.first
    get :find, format: :json, id: transaction.id

    assert_response :success
    assert_kind_of Hash, json_response
  end

  test '#find_all responds with all transactions' do
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
