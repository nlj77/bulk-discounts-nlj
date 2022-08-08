class BulkDiscount < ApplicationRecord
    validates_presence_of :name
    validates_presence_of :percentage
    validates_presence_of :threshold
    belongs_to :merchant
end