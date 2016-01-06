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
    respond_with Merchant.find_by(id: params[:id]).single_merchant_revenue(params)
  end
  #   total_revenue = Merchant.find_by(id: params[:id]).invoices
  #   .joins(:transactions)
  #   .successful
  #   .joins(:invoice_items)
  #   .where(status: "shipped")
  #   .sum("quantity * unit_price")
  #   hash = { "revenue" => total_revenue }
  #   respond_with hash
  # end

  def all_revenue_by_date
    respond_with Merchant.all_revenue_by_date(params)
  end

  def favorite_customer
    respond_with Merchant.find_by(id: params[:id]).favorite_customer
  end

  private

  def merchant_params
    params.permit(:id, :name, :created_at, :updated_at)
  end
end
