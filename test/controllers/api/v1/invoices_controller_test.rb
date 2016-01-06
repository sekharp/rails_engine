require 'test_helper'

class Api::V1::InvoicesControllerTest < ActionController::TestCase
  test '#index returns all invoices' do
    get :index, format: :json
    assert_response :success
  end
end
