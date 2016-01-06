require 'test_helper'

class Api::V1::MerchantsControllerTest < ActionController::TestCase
  test '#index returns all merchants' do
    get :index, format: :json
    assert_response :success
  end
end
