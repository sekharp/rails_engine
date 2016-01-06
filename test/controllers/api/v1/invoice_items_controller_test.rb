require 'test_helper'

class Api::V1::InvoiceItemsControllerTest < ActionController::TestCase
  test '#index returns all invoice_items' do
    get :index, format: :json
    assert_response :success
  end
end
