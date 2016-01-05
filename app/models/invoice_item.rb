class InvoiceItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :invoice
  before_save :format_dollar

  def self.random
    order("RANDOM()").first
  end

  private

  def format_dollar
    self.unit_price = unit_price/100.00
  end
end
