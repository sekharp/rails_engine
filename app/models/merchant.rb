class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices
  has_many :items

  def self.random
    order("RANDOM()").first
  end

  def favorite_customer
    Customer.joins(:invoices)
            .joins(:transactions)
            .where("invoices.merchant_id = ? AND transactions.result = 'success'", id)
            .group('id')
            .order('count(invoices.customer_id) DESC')
            .first
  end

  def single_merchant_revenue(params)
    if params[:date]
      sum_of_successful_transactions_by_date(params[:date])
    else
      sum_of_successful_transactions
    end
  end

  def sum_of_successful_transactions
    total = self.invoices.successful.joins(:invoice_items)
    .sum("invoice_items.quantity * invoice_items.unit_price").to_s
    { "revenue" => total}
  end

  def sum_of_successful_transactions_by_date(date)
    total = self.invoices.where(created_at: date).successful
    .joins(:invoice_items)
    .sum("invoice_items.quantity * invoice_items.unit_price").to_s
    { "revenue" => total}
  end

  def self.all_revenue_by_date(date)
    total = Invoice.joins(:transactions, :invoice_items)
    .where("transactions.result = ? AND invoices.created_at = ?", "success", date)
    .sum("invoice_items.quantity * invoice_items.unit_price")
    { "total_revenue" => total }
  end

  def pending_customers
    need_to_pay = []
    self.invoices.pending.map { |invoice| need_to_pay << invoice.customer }
    need_to_pay.uniq
  end

  # REFACTOR ALL OF THESE TO HAVE LOGIC IN THE MODEL FROM THE CONTROLLER

  # def somemethod
  #   Item.joins(:invoice_items).where( invoice_items: { unit_price: 55 } )
  # end
end
