require 'test_helper'

class Api::V1::TransactionsControllerTest < ActionController::TestCase
  test '#index returns all transactions' do
    get :index, format: :json
    assert_response :success
  end
end
