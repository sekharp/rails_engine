require 'test_helper'

class MerchantTest < ActiveSupport::TestCase
  def setup
    @merchant = Merchant.create!(name: 'Merchant')
    @customer = Customer.create!(first_name: "Sekhar", last_name: "Paladugu")
    invoice = @merchant.invoices.create!(customer_id: @customer.id, merchant_id: @merchant.id, created_at: "2012-03-16 11:55:05")
    transaction = invoice.transactions.create!(invoice_id: invoice.id, result: "success")
    failed_transaction = invoice.transactions.create!(invoice_id: invoice.id, result: "failed")
    item = Item.create!(name: "Item", description: "An item", unit_price: 6, merchant_id: @merchant.id)
    invoice_item = invoice.invoice_items.create!(item_id: item.id, invoice_id: invoice.id, quantity: 3, unit_price: 600)
  end

  test 'it is valid' do
    assert @merchant.valid?
  end

  test 'favorite customer returns proper record' do
    assert_equal @merchant.favorite_customer, @customer
  end

  test 'single merchant revenue works as intended' do
    expected_revenue_json = {"revenue"=>"18.0"}
    assert_equal expected_revenue_json, @merchant.single_merchant_revenue({id: @merchant.id})
  end

  test 'single merchant revenue by date works as intended' do
    expected_revenue_json = {"revenue"=>"18.0"}
    assert_equal expected_revenue_json, @merchant.single_merchant_revenue({id: @merchant.id, date: "2012-03-16 11:55:05"})
  end

  test 'all merchant revenue by date works as intended' do
    expected_total_revenue_json = Merchant.all_revenue_by_date("2012-03-16 11:55:05")
    assert_equal expected_total_revenue_json, Merchant.all_revenue_by_date("2012-03-16 11:55:05")
  end

  test 'pending customers works as expected' do
    assert_equal 1, @merchant.pending_customers.size
  end

end
