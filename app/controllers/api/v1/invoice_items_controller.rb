class Api::V1::InvoiceItemsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with InvoiceItem.all
  end

  def show
    respond_with find_invoice_item
  end

  def find
    respond_with find_invoice_item
  end

  def find_all
    respond_with InvoiceItem.where(invoice_item_params)
  end

  def random
    respond_with InvoiceItem.random
  end

  def invoice
    respond_with find_invoice_item.invoice
  end

  def item
    respond_with find_invoice_item.item
  end

  private

  def find_invoice_item
    InvoiceItem.find_by(invoice_item_params)
  end

  def invoice_item_params
    params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
  end
end
