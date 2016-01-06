class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices

  def self.random
    order("RANDOM()").first
  end

  def favorite_merchant
    Merchant.joins(:invoices)
            .joins(:transactions)
            .where("invoices.customer_id = ? AND transactions.result = 'success'", id)
            .group('id')
            .order('count(invoices.merchant_id) DESC')
            .first
  end

end
