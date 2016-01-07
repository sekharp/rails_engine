require 'test_helper'

class Api::V1::InvoiceItemsControllerTest < ActionController::TestCase
  test '#index returns all invoice_items' do
    get :index, format: :json
    assert_response :success
  end

  test '#show' do
    invoice_item = InvoiceItem.first
    get :show, format: :json, id: invoice_item.id

    assert_response :success
    assert_equal 1, invoice_item[:quantity]
    assert_equal 1, invoice_item[:unit_price]
  end

  test '#find responds with the correct invoice item' do
    invoice_item = InvoiceItem.first
    get :find, format: :json, id: invoice_item.id

    assert_response :success
    assert_kind_of Hash, json_response
  end

  test '#find_all responds with all invoice items' do
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
