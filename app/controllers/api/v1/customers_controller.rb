class Api::V1::CustomersController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Customer.all
  end

  def show
    respond_with Customer.find_by(id: params[:id])
  end

  def find
    respond_with Customer.find_by(customer_params)
  end

  def find_all
    respond_with Customer.where(customer_params)
  end

  def random
    respond_with Customer.random
  end

  def invoices
    respond_with Customer.find_by(id: params[:id]).invoices
  end

  def transactions
    respond_with Customer.find_by(id: params[:id]).transactions
  end

  def favorite_merchant
    # respond_with Customer.joins(:transactions).where({id: 1}, transactions: { result: "success" })
    invoice_ids_array = Customer.find(params[:id]).transactions.where(result: "success").pluck(:invoice_id)
    merchant_ids_array = Invoice.find(invoice_ids_array).map { |invoice| invoice.merchant_id }
    freq = merchants_ids_array.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    favorite_merchant_id = merchants_array.max_by { |v| freq[v] }
    respond_with Merchant.find(favorite_merchant_id)
    # respond_with Customer.find_by(id: params[:id]).transactions.where(result: "success").joins?
  end

  private

  # write private method for finding customer by param id

  def customer_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end
end
