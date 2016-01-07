class Api::V1::ItemsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Item.all
  end

  def show
    respond_with find_items
  end

  def find
    respond_with find_items
  end

  def find_all
    respond_with Item.where(item_params)
  end

  def random
    respond_with Item.random
  end

  def invoice_items
    respond_with find_items.invoice_items
  end

  def merchant
    respond_with find_items.merchant
  end

  private

  def find_items
    Item.find_by(item_params)
  end

  def item_params
    params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end
end
