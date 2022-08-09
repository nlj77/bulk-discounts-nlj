class InvoiceItem < ApplicationRecord
  enum status: [:packaged, :pending, :shipped]

  validates_presence_of :quantity
  validates_presence_of :unit_price
  validates_presence_of :status
  validates_presence_of :created_at
  validates_presence_of :updated_at

  belongs_to :item 
  belongs_to :invoice 
  has_many :transactions, through: :invoices 
  has_many :merchants, through: :item
  has_many :customers, through: :invoice
  has_many :transactions, through: :invoice  
  has_many :bulk_discounts, through: :item
  # has_many :invoices, through: :items 

  def discount_search
    # bulk_discounts.joins(:invoice_items)
    # .where("bulk_discounts.quantity_threshold <= ?", quantity)
    # .order(percentage_discount: :desc)
    # .first
  end

end
