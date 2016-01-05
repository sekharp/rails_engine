class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items

  before_save :format_dollar

  def self.random
    order("RANDOM()").first
  end

  private

  def format_dollar
    self.unit_price = unit_price/100.00
  end
end
