class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :items

  def self.random
    order("RANDOM()").first
  end

  # def somemethod
  #   Item.joins(:invoice_items).where( invoice_items: { unit_price: 55 } )
  # end
end
