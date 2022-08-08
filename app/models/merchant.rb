class Merchant < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :created_at
  validates_presence_of :updated_at

  has_many :items, dependent: :destroy
  has_many :bulk_discounts, dependent: :destroy
  has_many :invoice_items, through: :items
  has_many :invoices, through: :invoice_items
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices


  def top_5_customers
    Customer.joins(invoices: :transactions)
              .where(transactions:{result: "success"})
              .select("customers.*, COUNT(transactions.*) AS trans_count")
              .group("customers.id")
              .order(trans_count: :desc)
              .limit(5)
  end

  def items_ready_to_ship
    invoice_items.joins(:invoice).where.not(status: 2).order('invoices.created_at')
  end

  def self.top_five_merchants
      select('merchants.*, SUM(invoice_items.unit_price * invoice_items.quantity) AS revenue').joins(:invoice_items).group('merchants.id').order('revenue desc').limit(5)
  end

  def top_earning_day
    invoices.joins(:invoice_items).joins(:transactions).select('invoices.created_at AS date, SUM(invoice_items.unit_price * invoice_items.quantity) AS revenue').group('date').order('revenue desc, date desc').limit(1)
  end

  def top_5_items
    top_5_items = self.items.joins(invoice_items: [:invoice]).where(invoices: {status: 2}).select("items.*, sum(invoice_items.quantity * invoice_items.unit_price)").group(:id).order(sum: :desc).limit(5).to_a
  end
end
