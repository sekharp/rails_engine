class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant
  has_many :invoice_items
  has_many :transactions
  has_many :items, through: :invoice_items

  def self.random
    order("RANDOM()").first
  end

  def self.successful
    joins(:transactions).where("result=?", "success")
  end

  def self.pending
    joins(:transactions).where(transactions: {result: "failed"})
  end
end
