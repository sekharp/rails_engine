class Api::V1::TransactionsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Transaction.all
  end

  def show
    respond_with find_transaction
  end

  def find
    respond_with find_transaction
  end

  def find_all
    respond_with Transaction.where(transaction_params)
  end

  def random
    respond_with Transaction.random
  end

  def invoice
    respond_with find_transaction.invoice
  end

  private

  def find_transaction
    Transaction.find_by(transaction_params)
  end

  def transaction_params
    params.permit(:id, :invoice_id, :credit_card_number, :result, :created_at, :updated_at)
  end
end
