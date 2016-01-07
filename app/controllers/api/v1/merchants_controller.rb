class Api::V1::MerchantsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Merchant.all
  end

  def show
    respond_with find_merchant
  end

  def find
    respond_with find_merchant
  end

  def find_all
    respond_with Merchant.where(merchant_params)
  end

  def random
    respond_with Merchant.random
  end

  def items
    respond_with find_merchant.items
  end

  def invoices
    respond_with find_merchant.invoices
  end

  def revenue
    respond_with find_merchant.single_merchant_revenue(params)
  end

  def all_revenue_by_date
    respond_with Merchant.all_revenue_by_date(params[:date])
  end

  def favorite_customer
    respond_with find_merchant.favorite_customer
  end

  def customers_with_pending_invoices
    respond_with find_merchant.pending_customers
  end

  private

  def find_merchant
    Merchant.find_by(merchant_params)
  end

  def merchant_params
    params.permit(:id, :name, :created_at, :updated_at)
  end
end
