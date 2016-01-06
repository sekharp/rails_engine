require 'test_helper'

class Api::V1::CustomersControllerTest < ActionController::TestCase
  test '#index returns all customers' do
    get :index, format: :json
    assert_response :success
  end
end
