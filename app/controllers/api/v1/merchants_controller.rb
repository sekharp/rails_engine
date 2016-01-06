class Api::V1::MerchantsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find_by(id: params[:id])
  end

  def find
    respond_with Merchant.find_by(merchant_params)
  end

  def find_all
    respond_with Merchant.where(merchant_params)
  end

  def random
    respond_with Merchant.random
  end

  def items
    respond_with Merchant.find_by(id: params[:id]).items
  end

  def invoices
    respond_with Merchant.find_by(id: params[:id]).invoices
  end

  def revenue
    total_revenue = Merchant.find_by(id: params[:id]).invoices
    .joins(:transactions)
    .successful
    .joins(:invoice_items)
    .where(status: "shipped")
    .sum("quantity * unit_price")

    hash = { "revenue" => total_revenue }

    respond_with hash
    # invoices_ids = Merchant.find_by(id: params[:id]).transactions.where(result: "success").pluck(:invoice_id)
    # invoices = Invoice.find(invoices_ids)
    # respond_with invoices.map { |invoice| invoice.invoice_items.map { |ii| ii.total_price } }.flatten.sum.round(2)

    # Merchant.includes(:transactions, :invoice_items).where({id: 1}, transactions: { result: "success" })
  end

  def favorite_customer
    # Customer.joins(:invoices)
    #         .joins(:transactions)
    #         .where("invoices.merchant_id = ? AND transactions.result = 'success'", id)
    #         .group('id')
    #         .order('count(invoices.customer_id) DESC')
    #         .first
  end

  private

  def merchant_params
    params.permit(:id, :name, :created_at, :updated_at)
  end
end
