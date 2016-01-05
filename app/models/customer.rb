class Customer < ActiveRecord::Base
  has_many :invoices

  def self.random
    order("RANDOM()").first
  end
end
