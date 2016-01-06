class InvoiceItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :invoice
  before_save :format_dollar

  def self.random
    order("RANDOM()").first
  end

  def total_price
    self.unit_price.to_f * self.quantity
  end

  private

  def format_dollar
    self.unit_price = unit_price/100.00
  end
end
