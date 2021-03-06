require 'test_helper'

class Api::V1::InvoicesControllerTest < ActionController::TestCase
  test '#index returns all invoices' do
    get :index, format: :json
    assert_response :success
  end

  test '#show' do
    invoice = Invoice.first
    get :show, format: :json, id: invoice.id

    assert_response :success
    assert_equal "MyString", invoice[:status]
  end

  test '#find responds with the correct invoice' do
    invoice = Invoice.first
    get :find, format: :json, id: invoice.id

    assert_response :success
    assert_kind_of Hash, json_response
  end

  test '#find_all responds with all invoices' do
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
