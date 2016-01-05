class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items

  def self.random
    order("RANDOM()").first
  end
end
