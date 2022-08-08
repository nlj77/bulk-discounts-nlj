require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :created_at }
    it { should validate_presence_of :updated_at }
  end

  describe 'relationships' do
    it { should have_many :items }
    it { should have_many(:invoice_items).through(:items)}
    it { should have_many(:invoices).through(:invoice_items)}
    it { should have_many(:customers).through(:invoices)}
    it { should have_many(:transactions).through(:invoices)}

    it { should have_many(:bulk_discounts)}



  end

  describe '#top_5_customers' do
    it 'displays top 5 customers by transaction volume' do
    merchant_1 = Merchant.create!(name: "Schroeder-Jerde", created_at: Time.now, updated_at: Time.now)
    # merchant_2 = Merchant.create!(name: "Klein, Rempel and Jones", created_at: Time.now, updated_at: Time.now)
    item_1 = Item.create!(name: "Watch", description: "Always a need to tell time", unit_price: 3000, merchant_id: merchant_1.id, created_at: Time.now, updated_at: Time.now)
    item_2 = Item.create!(name: "Crocs", description: "Worst and Best Shoes", unit_price: 4000, merchant_id: merchant_1.id, created_at: Time.now, updated_at: Time.now)
    item_3 = Item.create!(name: "Beanie", description: "Perfect for a cold day", unit_price: 5000, merchant_id: merchant_1.id, created_at: Time.now, updated_at: Time.now)
    item_4 = Item.create!(name: "Socks", description: "Everyone loves socks", unit_price: 6000, merchant_id: merchant_1.id, created_at: Time.now, updated_at: Time.now)
    item_5 = Item.create!(name: "Necklace", description: "Who even wears these anymore", unit_price: 7000, merchant_id: merchant_1.id, created_at: Time.now, updated_at: Time.now)
    item_6 = Item.create!(name: "Wallet", description: "Money pocket for your pocket", unit_price: 8000, merchant_id: merchant_1.id, created_at: Time.now, updated_at: Time.now)
    item_7 = Item.create!(name: "Cowboy Hat", description: "Yehaw", unit_price: 9000, merchant_id: merchant_1.id, created_at: Time.now, updated_at: Time.now)
    customer_1 = Customer.create!(first_name: "James", last_name: "Franco", created_at: Time.now, updated_at: Time.now)
    customer_2 = Customer.create!(first_name: "Frank", last_name: "Jameson", created_at: Time.now, updated_at: Time.now)
    customer_3 = Customer.create!(first_name: "John", last_name: "Smith", created_at: Time.now, updated_at: Time.now)
    customer_4 = Customer.create!(first_name: "Zack", last_name: "Adams", created_at: Time.now, updated_at: Time.now)
    customer_5 = Customer.create!(first_name: "Chloe", last_name: "Wheeler", created_at: Time.now, updated_at: Time.now)
    customer_6 = Customer.create!(first_name: "Zoe", last_name: "Atkins", created_at: Time.now, updated_at: Time.now)
    customer_7 = Customer.create!(first_name: "Mike", last_name: "Dao", created_at: Time.now, updated_at: Time.now)
    customer_8 = Customer.create!(first_name: "Chris", last_name: "Simmons", created_at: Time.now, updated_at: Time.now)
    invoice_1 = customer_6.invoices.create!(status: 1, created_at: Time.now, updated_at: Time.now)
    invoice_2 = customer_6.invoices.create!(status: 1, created_at: Time.now, updated_at: Time.now)
    invoice_3 = customer_6.invoices.create!(status: 1, created_at: Time.now, updated_at: Time.now)
    invoice_4 = customer_6.invoices.create!(status: 1, created_at: Time.now, updated_at: Time.now)
    invoice_5 = customer_6.invoices.create!(status: 1, created_at: Time.now, updated_at: Time.now)
    invoice_6 = customer_3.invoices.create!(status: 1, created_at: Time.now, updated_at: Time.now)
    invoice_7 = customer_3.invoices.create!(status: 1, created_at: Time.now, updated_at: Time.now)
    invoice_8 = customer_3.invoices.create!(status: 1, created_at: Time.now, updated_at: Time.now)
    invoice_9 = customer_3.invoices.create!(status: 1, created_at: Time.now, updated_at: Time.now)
    invoice_10 = customer_5.invoices.create!(status: 1, created_at: Time.now, updated_at: Time.now)
    invoice_11 = customer_5.invoices.create!(status: 1, created_at: Time.now, updated_at: Time.now)
    invoice_12 = customer_5.invoices.create!(status: 1, created_at: Time.now, updated_at: Time.now)
    invoice_13 = customer_2.invoices.create!(status: 1, created_at: Time.now, updated_at: Time.now)
    invoice_14 = customer_2.invoices.create!(status: 1, created_at: Time.now, updated_at: Time.now)
    invoice_15 = customer_7.invoices.create!(status: 1, created_at: Time.now, updated_at: Time.now)
    # invoice_16 = customer_7.invoices.create!(status: 2, created_at: Time.now, updated_at: Time.now)
    # invoice_17 = customer_8.invoices.create!(status: 1, created_at: Time.now, updated_at: Time.now)
    invoice_item_1 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 1, unit_price: item_1.unit_price, status: 2, created_at: Time.now, updated_at: Time.now)
    invoice_item_2 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_2.id, quantity: 1, unit_price: item_1.unit_price, status: 2, created_at: Time.now, updated_at: Time.now)
    invoice_item_3 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_3.id, quantity: 1, unit_price: item_1.unit_price, status: 2, created_at: Time.now, updated_at: Time.now)
    invoice_item_4 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_4.id, quantity: 1, unit_price: item_1.unit_price, status: 2, created_at: Time.now, updated_at: Time.now)
    invoice_item_5 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_5.id, quantity: 1, unit_price: item_1.unit_price, status: 2, created_at: Time.now, updated_at: Time.now)
    invoice_item_6 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_6.id, quantity: 1, unit_price: item_1.unit_price, status: 2, created_at: Time.now, updated_at: Time.now)
    invoice_item_7 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_7.id, quantity: 1, unit_price:item_1.unit_price, status: 2, created_at: Time.now, updated_at: Time.now)
    invoice_item_8 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_8.id, quantity: 1, unit_price:item_1.unit_price, status: 2, created_at: Time.now, updated_at: Time.now)
    invoice_item_9 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_9.id, quantity: 1, unit_price:item_1.unit_price, status: 2, created_at: Time.now, updated_at: Time.now)
    invoice_item_10 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_10.id, quantity: 1, unit_price:item_1.unit_price, status: 2, created_at: Time.now, updated_at: Time.now)

    invoice_item_11 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_11.id, quantity: 1, unit_price:item_1.unit_price, status: 2, created_at: Time.now, updated_at: Time.now)
    invoice_item_12 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_12.id, quantity: 1, unit_price:item_1.unit_price, status: 2, created_at: Time.now, updated_at: Time.now)
    invoice_item_13 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_13.id, quantity: 1, unit_price:item_1.unit_price, status: 2, created_at: Time.now, updated_at: Time.now)
    invoice_item_14 = InvoiceItem.create!(item_id: item_4.id, invoice_id: invoice_14.id, quantity: 500, unit_price:item_4.unit_price, status: 2, created_at: Time.now, updated_at: Time.now)
    invoice_item_15 = InvoiceItem.create!(item_id: item_6.id, invoice_id: invoice_14.id, quantity: 1, unit_price:item_4.unit_price, status: 2, created_at: Time.now, updated_at: Time.now)
    invoice_item_16 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_14.id, quantity: 30, unit_price:item_1.unit_price, status: 2, created_at: Time.now, updated_at: Time.now)
    invoice_item_17 = InvoiceItem.create!(item_id: item_2.id, invoice_id: invoice_14.id, quantity: 30, unit_price:item_2.unit_price, status: 2, created_at: Time.now, updated_at: Time.now)
    invoice_item_18 = InvoiceItem.create!(item_id: item_3.id, invoice_id: invoice_14.id, quantity: 30, unit_price:item_3.unit_price, status: 2, created_at: Time.now, updated_at: Time.now)
    invoice_item_19 = InvoiceItem.create!(item_id: item_5.id, invoice_id: invoice_15.id, quantity: 700, unit_price: item_5.unit_price, status: 2, created_at: Time.now, updated_at: Time.now)
    # invoice_item_20 = InvoiceItem.create!(item_id: item_7.id, invoice_id: invoice_16.id, quantity: 700, unit_price: item_7.unit_price, status: 2, created_at: Time.now, updated_at: Time.now)
    # invoice_item_21 = InvoiceItem.create!(item_id: item_7.id, invoice_id: invoice_17.id, quantity: 300, unit_price: item_7.unit_price, status: 2, created_at: Time.now, updated_at: Time.now)
    transaction_1 = Transaction.create!(invoice_id: invoice_1.id, credit_card_number: '4039485738495837', credit_card_expiration_date: "1", result: "success", created_at: Time.now, updated_at: Time.now)
    transaction_2 = Transaction.create!(invoice_id: invoice_2.id, credit_card_number: '4039485738495837', credit_card_expiration_date: "1", result: "success", created_at: Time.now, updated_at: Time.now)
    transaction_3 = Transaction.create!(invoice_id: invoice_3.id, credit_card_number: '4039485738495837', credit_card_expiration_date: "1", result: "success", created_at: Time.now, updated_at: Time.now)
    transaction_4 = Transaction.create!(invoice_id: invoice_4.id, credit_card_number: '4847583748374837', credit_card_expiration_date: "1", result: "success", created_at: Time.now, updated_at: Time.now)
    transaction_5 = Transaction.create!(invoice_id: invoice_5.id, credit_card_number: '4847583748374837', credit_card_expiration_date: "1", result: "success", created_at: Time.now, updated_at: Time.now)
    transaction_6 = Transaction.create!(invoice_id: invoice_6.id, credit_card_number: '4847583748374837', credit_card_expiration_date: "1", result: "success", created_at: Time.now, updated_at: Time.now)
    transaction_7 = Transaction.create!(invoice_id: invoice_7.id, credit_card_number: '4364756374652636', credit_card_expiration_date: "1", result: "success", created_at: Time.now, updated_at: Time.now)
    transaction_8 = Transaction.create!(invoice_id: invoice_8.id, credit_card_number: '4364756374652636', credit_card_expiration_date: "1", result: "success", created_at: Time.now, updated_at: Time.now)
    transaction_9 = Transaction.create!(invoice_id: invoice_9.id, credit_card_number: '4928294837461125', credit_card_expiration_date: "1", result: "success", created_at: Time.now, updated_at: Time.now)
    transaction_10 = Transaction.create!(invoice_id: invoice_10.id, credit_card_number: '4928294837461125', credit_card_expiration_date: "1", result: "success", created_at: Time.now, updated_at: Time.now)
    transaction_11 = Transaction.create!(invoice_id: invoice_11.id, credit_card_number: '4738473664751832', credit_card_expiration_date: "1", result: "success", created_at: Time.now, updated_at: Time.now)
    transaction_12 = Transaction.create!(invoice_id: invoice_12.id, credit_card_number: '4738473664751832', credit_card_expiration_date: "1", result: "success", created_at: Time.now, updated_at: Time.now)
    transaction_13 = Transaction.create!(invoice_id: invoice_13.id, credit_card_number: '4023948573948293', credit_card_expiration_date: "1", result: "success", created_at: Time.now, updated_at: Time.now)
    transaction_14 = Transaction.create!(invoice_id: invoice_14.id, credit_card_number: '4023948573948293', credit_card_expiration_date: "1", result: "success", created_at: Time.now, updated_at: Time.now)
    transaction_15 = Transaction.create!(invoice_id: invoice_15.id, credit_card_number: '4023948573948293', credit_card_expiration_date: "1", result: "success", created_at: Time.now, updated_at: Time.now)
    # transaction_16 = Transaction.create!(invoice_id: invoice_16.id, credit_card_number: '4023948573948394', credit_card_expiration_date: "1", result: "success", created_at: Time.now, updated_at: Time.now)

      # expect(merchant_1.top_5_customers).to eq([customer_1, customer_2, customer_4, customer_6, customer_8])

      # expect(merchant_1.top_5_customers).to eq([customer_1, customer_2])
      expect(merchant_1.top_5_customers).to eq([customer_6, customer_3, customer_5, customer_2, customer_7])
      # expect(merchant_2.top_5_customers).to eq([customer_7])

    end

    it "can show top five merchants" do
      merchant_1 = Merchant.create!(name: "Schroeder-Jerde", created_at: Time.now, updated_at: Time.now, status: "enabled")
      merchant_2 = Merchant.create!(name: "Bobs Cranes", created_at: Time.now, updated_at: Time.now, status: "enabled")
      merchant_3 = Merchant.create!(name: "Joe-Schmo Railroads", created_at: Time.now, updated_at: Time.now, status: "enabled")
      merchant_4 = Merchant.create!(name: "Allison Bugaboo", created_at: Time.now, updated_at: Time.now, status: "enabled")
      merchant_5 = Merchant.create!(name: "Castanza George", created_at: Time.now, updated_at: Time.now, status: "enabled")
      merchant_6 = Merchant.create!(name: "Ali Baba", created_at: Time.now, updated_at: Time.now, status: "enabled")

      customer_1 = Customer.create!(first_name: "John", last_name: "Smith", created_at: Time.now, updated_at: Time.now)
      customer_2 = Customer.create!(first_name: "Kyle", last_name: "Johnson", created_at: Time.now, updated_at: Time.now)
      customer_3 = Customer.create!(first_name: "Bert", last_name: "Kyleson", created_at: Time.now, updated_at: Time.now)
      customer_4 = Customer.create!(first_name: "Randall", last_name: "Bertson", created_at: Time.now, updated_at: Time.now)
      customer_5 = Customer.create!(first_name: "Craig", last_name: "Randalson", created_at: Time.now, updated_at: Time.now)
      customer_6 = Customer.create!(first_name: "Geoff", last_name: "Craigson", created_at: Time.now, updated_at: Time.now)

      invoice_1 = Invoice.create!(status: :completed, created_at: Time.now, updated_at: Time.now, customer_id: customer_5.id )
      invoice_2 = Invoice.create!(status: :completed, created_at: Time.now, updated_at: Time.now, customer_id: customer_5.id )
      invoice_3 = Invoice.create!(status: :completed, created_at: Time.now, updated_at: Time.now, customer_id: customer_5.id )
      invoice_4 = Invoice.create!(status: :completed, created_at: "2012-03-25 09:54:09 UTC", updated_at: Time.now, customer_id: customer_5.id )
      invoice_5 = Invoice.create!(status: :completed, created_at: "2012-03-26 06:54:10 UTC", updated_at: Time.now, customer_id: customer_5.id )
      invoice_6 = Invoice.create!(status: :completed, created_at: "2012-03-17 08:54:11 UTC", updated_at: Time.now, customer_id: customer_4.id )
      invoice_7 = Invoice.create!(status: :completed, created_at: "2012-03-17 08:54:11 UTC", updated_at: Time.now, customer_id: customer_4.id )
      invoice_8 = Invoice.create!(status: :completed, created_at: "2012-03-17 08:54:11 UTC", updated_at: Time.now, customer_id: customer_4.id )
      invoice_9 = Invoice.create!(status: :completed, created_at: "2012-03-17 08:54:11 UTC", updated_at: Time.now, customer_id: customer_4.id )
      invoice_10 = Invoice.create!(status: :completed, created_at: "2012-03-17 08:54:11 UTC", updated_at: Time.now, customer_id: customer_3.id )
      invoice_11 = Invoice.create!(status: :completed, created_at: "2012-03-17 08:54:11 UTC", updated_at: Time.now, customer_id: customer_3.id )
      invoice_12 = Invoice.create!(status: :completed, created_at: "2012-03-17 08:54:11 UTC", updated_at: Time.now, customer_id: customer_3.id )
      invoice_13 = Invoice.create!(status: :completed, created_at: "2012-03-17 08:54:11 UTC", updated_at: Time.now, customer_id: customer_2.id )
      invoice_14 = Invoice.create!(status: :completed, created_at: "2012-03-17 08:54:11 UTC", updated_at: Time.now, customer_id: customer_2.id )
      invoice_15 = Invoice.create!(status: :completed, created_at: "2012-03-17 08:54:11 UTC", updated_at: Time.now, customer_id: customer_1.id )

      item_1 = Item.create!(name: "Watch", description: "Always a need to tell time", unit_price: 3000, merchant_id: merchant_1.id, created_at: Time.now, updated_at: Time.now)
      item_2 = Item.create!(name: "Crocs", description: "Worst and Best Shoes", unit_price: 4000, merchant_id: merchant_2.id, created_at: Time.now, updated_at: Time.now)
      item_3 = Item.create!(name: "Beanie", description: "Perfect for a cold day", unit_price: 5000, merchant_id: merchant_3.id, created_at: Time.now, updated_at: Time.now)
      item_4 = Item.create!(name: "Socks", description: "Everyone loves socks", unit_price: 6000, merchant_id: merchant_4.id, created_at: Time.now, updated_at: Time.now)
      item_5 = Item.create!(name: "Necklace", description: "Who even wears these anymore", unit_price: 7000, merchant_id: merchant_5.id, created_at: Time.now, updated_at: Time.now)
      item_6 = Item.create!(name: "Wallet", description: "Money pocket for your pocket", unit_price: 8000, merchant_id: merchant_6.id, created_at: Time.now, updated_at: Time.now)


      invoice_item_1 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 1, unit_price: item_1.unit_price, status: 2, created_at: Time.now, updated_at: Time.now)
      invoice_item_2 = InvoiceItem.create!(item_id: item_2.id, invoice_id: invoice_2.id, quantity: 1, unit_price: item_2.unit_price, status: 2, created_at: Time.now, updated_at: Time.now)
      invoice_item_3 = InvoiceItem.create!(item_id: item_3.id, invoice_id: invoice_3.id, quantity: 1, unit_price: item_3.unit_price, status: 2, created_at: Time.now, updated_at: Time.now)
      invoice_item_4 = InvoiceItem.create!(item_id: item_4.id, invoice_id: invoice_4.id, quantity: 1, unit_price: item_4.unit_price, status: 0, created_at: Time.now, updated_at: Time.now)
      invoice_item_5 = InvoiceItem.create!(item_id: item_5.id, invoice_id: invoice_5.id, quantity: 1, unit_price: item_5.unit_price, status: 0, created_at: Time.now, updated_at: Time.now)
      invoice_item_6 = InvoiceItem.create!(item_id: item_6.id, invoice_id: invoice_6.id, quantity: 1, unit_price: item_6.unit_price, status: 1, created_at: Time.now, updated_at: Time.now)
      invoice_item_7 = InvoiceItem.create!(item_id: item_6.id, invoice_id: invoice_7.id, quantity: 1, unit_price: item_6.unit_price, status: 1, created_at: Time.now, updated_at: Time.now)
      invoice_item_8 = InvoiceItem.create!(item_id: item_6.id, invoice_id: invoice_8.id, quantity: 1, unit_price: item_6.unit_price, status: 1, created_at: Time.now, updated_at: Time.now)
      invoice_item_9 = InvoiceItem.create!(item_id: item_6.id, invoice_id: invoice_9.id, quantity: 1, unit_price: item_6.unit_price, status: 1, created_at: Time.now, updated_at: Time.now)
      invoice_item_10 = InvoiceItem.create!(item_id: item_6.id, invoice_id: invoice_10.id, quantity: 1, unit_price: item_6.unit_price, status: 1, created_at: Time.now, updated_at: Time.now)
      invoice_item_11 = InvoiceItem.create!(item_id: item_6.id, invoice_id: invoice_11.id, quantity: 1, unit_price: item_6.unit_price, status: 1, created_at: Time.now, updated_at: Time.now)
      invoice_item_12 = InvoiceItem.create!(item_id: item_6.id, invoice_id: invoice_12.id, quantity: 1, unit_price: item_6.unit_price, status: 1, created_at: Time.now, updated_at: Time.now)
      invoice_item_13 = InvoiceItem.create!(item_id: item_6.id, invoice_id: invoice_13.id, quantity: 1, unit_price: item_6.unit_price, status: 1, created_at: Time.now, updated_at: Time.now)
      invoice_item_14 = InvoiceItem.create!(item_id: item_6.id, invoice_id: invoice_14.id, quantity: 1, unit_price: item_6.unit_price, status: 1, created_at: Time.now, updated_at: Time.now)
      invoice_item_15 = InvoiceItem.create!(item_id: item_6.id, invoice_id: invoice_15.id, quantity: 1, unit_price: item_6.unit_price, status: 1, created_at: Time.now, updated_at: Time.now)

      transaction_1 = Transaction.create!(credit_card_number:4444555566667777, result: "success",created_at: Time.now, updated_at: Time.now, invoice_id:invoice_1.id )
      transaction_2 = Transaction.create!(credit_card_number:4445555566667777, result: "success",created_at: Time.now, updated_at: Time.now, invoice_id:invoice_2.id )
      transaction_3 = Transaction.create!(credit_card_number:4446555566667777, result: "success",created_at: Time.now, updated_at: Time.now, invoice_id:invoice_3.id )
      transaction_4 = Transaction.create!(credit_card_number:4447555566667777, result: "success",created_at: Time.now, updated_at: Time.now, invoice_id:invoice_4.id )
      transaction_5 = Transaction.create!(credit_card_number:4448555566667777, result: "success",created_at: Time.now, updated_at: Time.now, invoice_id:invoice_5.id )
      transaction_6 = Transaction.create!(credit_card_number:4449555566667777, result: "success",created_at: Time.now, updated_at: Time.now, invoice_id:invoice_6.id )
      transaction_7 = Transaction.create!(credit_card_number:4449555566667777, result: "success",created_at: Time.now, updated_at: Time.now, invoice_id:invoice_7.id )
      transaction_8 = Transaction.create!(credit_card_number:4449555566667777, result: "success",created_at: Time.now, updated_at: Time.now, invoice_id:invoice_8.id )
      transaction_9 = Transaction.create!(credit_card_number:4449555566667777, result: "success",created_at: Time.now, updated_at: Time.now, invoice_id:invoice_9.id )
      transaction_10 = Transaction.create!(credit_card_number:4449555566667777, result: "success",created_at: Time.now, updated_at: Time.now, invoice_id:invoice_10.id )
      transaction_11 = Transaction.create!(credit_card_number:4449555566667777, result: "success",created_at: Time.now, updated_at: Time.now, invoice_id:invoice_11.id )
      transaction_12 = Transaction.create!(credit_card_number:4449555566667777, result: "success",created_at: Time.now, updated_at: Time.now, invoice_id:invoice_12.id )
      transaction_13 = Transaction.create!(credit_card_number:4449555566667777, result: "success",created_at: Time.now, updated_at: Time.now, invoice_id:invoice_13.id )
      transaction_14 = Transaction.create!(credit_card_number:4449555566667777, result: "success",created_at: Time.now, updated_at: Time.now, invoice_id:invoice_14.id )
      transaction_15 = Transaction.create!(credit_card_number:4449555566667777, result: "success",created_at: Time.now, updated_at: Time.now, invoice_id:invoice_15.id )

      expect(Merchant.top_five_merchants[0]).to eq(merchant_6)
      expect(Merchant.top_five_merchants[1]).to eq(merchant_5)

    end

    it "can show the top five merchant's model days" do
      merchant_1 = Merchant.create!(name: "Schroeder-Jerde", created_at: Time.now, updated_at: Time.now, status: "enabled")
      merchant_2 = Merchant.create!(name: "Bobs Cranes", created_at: Time.now, updated_at: Time.now, status: "enabled")
      merchant_3 = Merchant.create!(name: "Joe-Schmo Railroads", created_at: Time.now, updated_at: Time.now, status: "enabled")
      merchant_4 = Merchant.create!(name: "Allison Bugaboo", created_at: Time.now, updated_at: Time.now, status: "enabled")
      merchant_5 = Merchant.create!(name: "Castanza George", created_at: Time.now, updated_at: Time.now, status: "enabled")
      merchant_6 = Merchant.create!(name: "Ali Baba", created_at: Time.now, updated_at: Time.now, status: "enabled")

      customer_1 = Customer.create!(first_name: "John", last_name: "Smith", created_at: Time.now, updated_at: Time.now)
      customer_2 = Customer.create!(first_name: "Kyle", last_name: "Johnson", created_at: Time.now, updated_at: Time.now)
      customer_3 = Customer.create!(first_name: "Bert", last_name: "Kyleson", created_at: Time.now, updated_at: Time.now)
      customer_4 = Customer.create!(first_name: "Randall", last_name: "Bertson", created_at: Time.now, updated_at: Time.now)
      customer_5 = Customer.create!(first_name: "Craig", last_name: "Randalson", created_at: Time.now, updated_at: Time.now)
      customer_6 = Customer.create!(first_name: "Geoff", last_name: "Craigson", created_at: Time.now, updated_at: Time.now)

      invoice_1 = Invoice.create!(status: :completed, created_at: "2012-03-25 09:54:09 UTC", updated_at: Time.now, customer_id: customer_5.id )
      invoice_2 = Invoice.create!(status: :completed, created_at: "2012-03-25 09:54:09 UTC", updated_at: Time.now, customer_id: customer_5.id )
      invoice_3 = Invoice.create!(status: :completed, created_at: "2012-03-25 09:54:09 UTC", updated_at: Time.now, customer_id: customer_5.id )
      invoice_4 = Invoice.create!(status: :completed, created_at: "2012-03-25 09:54:09 UTC", updated_at: Time.now, customer_id: customer_5.id )
      invoice_5 = Invoice.create!(status: :completed, created_at: "2012-03-26 06:54:10 UTC", updated_at: Time.now, customer_id: customer_5.id )
      invoice_6 = Invoice.create!(status: :completed, created_at: "2012-03-17 08:54:11 UTC", updated_at: Time.now, customer_id: customer_4.id )
      invoice_7 = Invoice.create!(status: :completed, created_at: "2012-03-17 08:54:11 UTC", updated_at: Time.now, customer_id: customer_4.id )
      invoice_8 = Invoice.create!(status: :completed, created_at: "2012-03-17 08:54:11 UTC", updated_at: Time.now, customer_id: customer_4.id )
      invoice_9 = Invoice.create!(status: :completed, created_at: "2012-03-17 08:54:11 UTC", updated_at: Time.now, customer_id: customer_4.id )
      invoice_10 = Invoice.create!(status: :completed, created_at: "2012-03-17 08:54:11 UTC", updated_at: Time.now, customer_id: customer_3.id )
      invoice_11 = Invoice.create!(status: :completed, created_at: "2012-03-17 08:54:11 UTC", updated_at: Time.now, customer_id: customer_3.id )
      invoice_12 = Invoice.create!(status: :completed, created_at: "2012-03-17 08:54:11 UTC", updated_at: Time.now, customer_id: customer_3.id )
      invoice_13 = Invoice.create!(status: :completed, created_at: "2012-03-17 08:54:11 UTC", updated_at: Time.now, customer_id: customer_2.id )
      invoice_14 = Invoice.create!(status: :completed, created_at: "2012-03-17 08:54:11 UTC", updated_at: Time.now, customer_id: customer_2.id )
      invoice_15 = Invoice.create!(status: :completed, created_at: "2012-03-17 08:54:11 UTC", updated_at: Time.now, customer_id: customer_1.id )

      item_1 = Item.create!(name: "Watch", description: "Always a need to tell time", unit_price: 3000, merchant_id: merchant_1.id, created_at: Time.now, updated_at: Time.now)
      item_2 = Item.create!(name: "Crocs", description: "Worst and Best Shoes", unit_price: 4000, merchant_id: merchant_2.id, created_at: Time.now, updated_at: Time.now)
      item_3 = Item.create!(name: "Beanie", description: "Perfect for a cold day", unit_price: 5000, merchant_id: merchant_3.id, created_at: Time.now, updated_at: Time.now)
      item_4 = Item.create!(name: "Socks", description: "Everyone loves socks", unit_price: 6000, merchant_id: merchant_4.id, created_at: Time.now, updated_at: Time.now)
      item_5 = Item.create!(name: "Necklace", description: "Who even wears these anymore", unit_price: 7000, merchant_id: merchant_5.id, created_at: Time.now, updated_at: Time.now)
      item_6 = Item.create!(name: "Wallet", description: "Money pocket for your pocket", unit_price: 8000, merchant_id: merchant_6.id, created_at: Time.now, updated_at: Time.now)

      invoice_item_1 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 1, unit_price: item_1.unit_price, status: 2, created_at: Time.now, updated_at: Time.now)
      invoice_item_2 = InvoiceItem.create!(item_id: item_2.id, invoice_id: invoice_2.id, quantity: 1, unit_price: item_2.unit_price, status: 2, created_at: Time.now, updated_at: Time.now)
      invoice_item_3 = InvoiceItem.create!(item_id: item_3.id, invoice_id: invoice_3.id, quantity: 1, unit_price: item_3.unit_price, status: 2, created_at: Time.now, updated_at: Time.now)
      invoice_item_4 = InvoiceItem.create!(item_id: item_4.id, invoice_id: invoice_4.id, quantity: 1, unit_price: item_4.unit_price, status: 0, created_at: Time.now, updated_at: Time.now)
      invoice_item_5 = InvoiceItem.create!(item_id: item_5.id, invoice_id: invoice_5.id, quantity: 1, unit_price: item_5.unit_price, status: 0, created_at: Time.now, updated_at: Time.now)
      invoice_item_6 = InvoiceItem.create!(item_id: item_6.id, invoice_id: invoice_6.id, quantity: 1, unit_price: item_6.unit_price, status: 1, created_at: Time.now, updated_at: Time.now)
      invoice_item_7 = InvoiceItem.create!(item_id: item_6.id, invoice_id: invoice_7.id, quantity: 1, unit_price: item_6.unit_price, status: 1, created_at: Time.now, updated_at: Time.now)
      invoice_item_8 = InvoiceItem.create!(item_id: item_6.id, invoice_id: invoice_8.id, quantity: 1, unit_price: item_6.unit_price, status: 1, created_at: Time.now, updated_at: Time.now)
      invoice_item_9 = InvoiceItem.create!(item_id: item_6.id, invoice_id: invoice_9.id, quantity: 1, unit_price: item_6.unit_price, status: 1, created_at: Time.now, updated_at: Time.now)
      invoice_item_10 = InvoiceItem.create!(item_id: item_6.id, invoice_id: invoice_10.id, quantity: 1, unit_price: item_6.unit_price, status: 1, created_at: Time.now, updated_at: Time.now)
      invoice_item_11 = InvoiceItem.create!(item_id: item_6.id, invoice_id: invoice_11.id, quantity: 1, unit_price: item_6.unit_price, status: 1, created_at: Time.now, updated_at: Time.now)
      invoice_item_12 = InvoiceItem.create!(item_id: item_6.id, invoice_id: invoice_12.id, quantity: 1, unit_price: item_6.unit_price, status: 1, created_at: Time.now, updated_at: Time.now)
      invoice_item_13 = InvoiceItem.create!(item_id: item_6.id, invoice_id: invoice_13.id, quantity: 1, unit_price: item_6.unit_price, status: 1, created_at: Time.now, updated_at: Time.now)
      invoice_item_14 = InvoiceItem.create!(item_id: item_6.id, invoice_id: invoice_14.id, quantity: 1, unit_price: item_6.unit_price, status: 1, created_at: Time.now, updated_at: Time.now)
      invoice_item_15 = InvoiceItem.create!(item_id: item_6.id, invoice_id: invoice_15.id, quantity: 1, unit_price: item_6.unit_price, status: 1, created_at: Time.now, updated_at: Time.now)

      transaction_1 = Transaction.create!(credit_card_number:4444555566667777, result: "success",created_at: Time.now, updated_at: Time.now, invoice_id:invoice_1.id )
      transaction_2 = Transaction.create!(credit_card_number:4445555566667777, result: "success",created_at: Time.now, updated_at: Time.now, invoice_id:invoice_2.id )
      transaction_3 = Transaction.create!(credit_card_number:4446555566667777, result: "success",created_at: Time.now, updated_at: Time.now, invoice_id:invoice_3.id )
      transaction_4 = Transaction.create!(credit_card_number:4447555566667777, result: "success",created_at: Time.now, updated_at: Time.now, invoice_id:invoice_4.id )
      transaction_5 = Transaction.create!(credit_card_number:4448555566667777, result: "success",created_at: Time.now, updated_at: Time.now, invoice_id:invoice_5.id )
      transaction_6 = Transaction.create!(credit_card_number:4449555566667777, result: "success",created_at: Time.now, updated_at: Time.now, invoice_id:invoice_6.id )
      transaction_7 = Transaction.create!(credit_card_number:4449555566667777, result: "success",created_at: Time.now, updated_at: Time.now, invoice_id:invoice_7.id )
      transaction_8 = Transaction.create!(credit_card_number:4449555566667777, result: "success",created_at: Time.now, updated_at: Time.now, invoice_id:invoice_8.id )
      transaction_9 = Transaction.create!(credit_card_number:4449555566667777, result: "success",created_at: Time.now, updated_at: Time.now, invoice_id:invoice_9.id )
      transaction_10 = Transaction.create!(credit_card_number:4449555566667777, result: "success",created_at: Time.now, updated_at: Time.now, invoice_id:invoice_10.id )
      transaction_11 = Transaction.create!(credit_card_number:4449555566667777, result: "success",created_at: Time.now, updated_at: Time.now, invoice_id:invoice_11.id )
      transaction_12 = Transaction.create!(credit_card_number:4449555566667777, result: "success",created_at: Time.now, updated_at: Time.now, invoice_id:invoice_12.id )
      transaction_13 = Transaction.create!(credit_card_number:4449555566667777, result: "success",created_at: Time.now, updated_at: Time.now, invoice_id:invoice_13.id )
      transaction_14 = Transaction.create!(credit_card_number:4449555566667777, result: "success",created_at: Time.now, updated_at: Time.now, invoice_id:invoice_14.id )
      transaction_15 = Transaction.create!(credit_card_number:4449555566667777, result: "success",created_at: Time.now, updated_at: Time.now, invoice_id:invoice_15.id )

      expect(merchant_6.top_earning_day[0].date).to eq("2012-03-17 08:54:11 UTC")
      expect(merchant_5.top_earning_day[0].date).to eq("2012-03-26 06:54:10 UTC")
    end
  end

    it 'displays status of items ready to ship' do
        merchant_1 = Merchant.create!(name: "Schroeder-Jerde", created_at: Time.now, updated_at: Time.now)
        merchant_2 = Merchant.create!(name: "Klein, Rempel and Jones", created_at: Time.now, updated_at: Time.now)
        item_1 = Item.create!(name: "Watch", description: "Always a need to tell time", unit_price: 3000, merchant_id: merchant_1.id, created_at: Time.now, updated_at: Time.now)
        item_2 = Item.create!(name: "Crocs", description: "Worst and Best Shoes", unit_price: 4000, merchant_id: merchant_1.id, created_at: Time.now, updated_at: Time.now)
        item_3 = Item.create!(name: "Beanie", description: "Perfect for a cold day", unit_price: 5000, merchant_id: merchant_1.id, created_at: Time.now, updated_at: Time.now)
        item_4 = Item.create!(name: "Coat", description: "Perfect for a rainy day", unit_price: 6000, merchant_id: merchant_2.id, created_at: Time.now, updated_at: Time.now)

        customer_1 = Customer.create!(first_name: "Zoe", last_name: "Atkins", created_at: Time.now, updated_at: Time.now)
        customer_2 = Customer.create!(first_name: "Frank", last_name: "Jameson", created_at: Time.now, updated_at: Time.now)

        invoice_1 = customer_1.invoices.create!(status: 1, created_at: Time.now, updated_at: Time.now)
        invoice_2 = customer_1.invoices.create!(status: 1, created_at: Time.now, updated_at: Time.now)
        invoice_3 = customer_1.invoices.create!(status: 1, created_at: Time.now, updated_at: Time.now)
        invoice_4 = customer_2.invoices.create!(status: 1, created_at: Time.now, updated_at: Time.now)
        invoice_5 = customer_2.invoices.create!(status: 1, created_at: Time.now, updated_at: Time.now)
        invoice_6 = customer_2.invoices.create!(status: 1, created_at: Time.now, updated_at: Time.now)

        invoice_item_1 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 1, unit_price: item_1.unit_price, status: 0, created_at: Time.now, updated_at: Time.now)
        invoice_item_2 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_2.id, quantity: 1, unit_price: item_1.unit_price, status: 1, created_at: Time.now, updated_at: Time.now)
        invoice_item_3 = InvoiceItem.create!(item_id: item_2.id, invoice_id: invoice_2.id, quantity: 1, unit_price: item_2.unit_price, status: 2, created_at: Time.now, updated_at: Time.now)
        invoice_item_4 = InvoiceItem.create!(item_id: item_3.id, invoice_id: invoice_2.id, quantity: 1, unit_price: item_3.unit_price, status: 2, created_at: Time.now, updated_at: Time.now)
        invoice_item_5 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_4.id, quantity: 1, unit_price: item_1.unit_price, status: 1, created_at: Time.now, updated_at: Time.now)
        invoice_item_6 = InvoiceItem.create!(item_id: item_2.id, invoice_id: invoice_4.id, quantity: 1, unit_price: item_2.unit_price, status: 1, created_at: Time.now, updated_at: Time.now)
        invoice_item_7 = InvoiceItem.create!(item_id: item_4.id, invoice_id: invoice_6.id, quantity: 1, unit_price: item_4.unit_price, status: 1, created_at: Time.now, updated_at: Time.now)

        expect(merchant_1.items_ready_to_ship).to eq([invoice_item_1, invoice_item_2, invoice_item_5, invoice_item_6])
      end

      describe "#top_5_items" do
        it "returns the top 5 items" do
          merchant_1 = Merchant.create!(name: "Schroeder-Jerde", created_at: Time.now, updated_at: Time.now)
          item_1 = Item.create!(name: "Watch", description: "Always a need to tell time", unit_price: 3000, merchant_id: merchant_1.id, created_at: Time.now, updated_at: Time.now)
          item_2 = Item.create!(name: "Crocs", description: "Worst and Best Shoes", unit_price: 4000, merchant_id: merchant_1.id, created_at: Time.now, updated_at: Time.now)
          item_3 = Item.create!(name: "Beanie", description: "Perfect for a cold day", unit_price: 5000, merchant_id: merchant_1.id, created_at: Time.now, updated_at: Time.now)
          item_4 = Item.create!(name: "Socks", description: "Everyone loves socks", unit_price: 6000, merchant_id: merchant_1.id, created_at: Time.now, updated_at: Time.now)
          item_5 = Item.create!(name: "Necklace", description: "Who even wears these anymore", unit_price: 7000, merchant_id: merchant_1.id, created_at: Time.now, updated_at: Time.now)
          item_6 = Item.create!(name: "Wallet", description: "Money pocket for your pocket", unit_price: 8000, merchant_id: merchant_1.id, created_at: Time.now, updated_at: Time.now)
          customer_1 = Customer.create!(first_name: "James", last_name: "Franco", created_at: Time.now, updated_at: Time.now)
          customer_2 = Customer.create!(first_name: "Frank", last_name: "Jameson", created_at: Time.now, updated_at: Time.now)
          customer_3 = Customer.create!(first_name: "John", last_name: "Smith", created_at: Time.now, updated_at: Time.now)
          customer_4 = Customer.create!(first_name: "Zack", last_name: "Adams", created_at: Time.now, updated_at: Time.now)
          customer_5 = Customer.create!(first_name: "Chloe", last_name: "Wheeler", created_at: Time.now, updated_at: Time.now)
          customer_6 = Customer.create!(first_name: "Zoe", last_name: "Atkins", created_at: Time.now, updated_at: Time.now)
          invoice_1 = customer_1.invoices.create!(status: 2, created_at: Time.now, updated_at: Time.now)
          invoice_2 = customer_1.invoices.create!(status: 2, created_at: Time.now, updated_at: Time.now)
          invoice_3 = customer_1.invoices.create!(status: 2, created_at: Time.now, updated_at: Time.now)
          invoice_4 = customer_1.invoices.create!(status: 2, created_at: Time.now, updated_at: Time.now)
          invoice_5 = customer_1.invoices.create!(status: 2, created_at: Time.now, updated_at: Time.now)
          invoice_6 = customer_1.invoices.create!(status: 2, created_at: Time.now, updated_at: Time.now)
          invoice_item_1 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 6, unit_price: item_1.unit_price, status: 2, created_at: Time.now, updated_at: Time.now)
          invoice_item_2 = InvoiceItem.create!(item_id: item_2.id, invoice_id: invoice_2.id, quantity: 5, unit_price: item_1.unit_price, status: 2, created_at: Time.now, updated_at: Time.now)
          invoice_item_3 = InvoiceItem.create!(item_id: item_3.id, invoice_id: invoice_3.id, quantity: 4, unit_price: item_1.unit_price, status: 2, created_at: Time.now, updated_at: Time.now)
          invoice_item_4 = InvoiceItem.create!(item_id: item_4.id, invoice_id: invoice_4.id, quantity: 3, unit_price: item_1.unit_price, status: 2, created_at: Time.now, updated_at: Time.now)
          invoice_item_5 = InvoiceItem.create!(item_id: item_5.id, invoice_id: invoice_5.id, quantity: 2, unit_price: item_1.unit_price, status: 2, created_at: Time.now, updated_at: Time.now)
          invoice_item_6 = InvoiceItem.create!(item_id: item_6.id, invoice_id: invoice_6.id, quantity: 1, unit_price: item_1.unit_price, status: 2, created_at: Time.now, updated_at: Time.now)
          expect(merchant_1.top_5_items).to eq([item_1, item_2, item_3, item_4, item_5])

        end
      end
end
