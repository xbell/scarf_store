class Item < ActiveRecord::Base
  belongs_to :order
  belongs_to :product_option

  validates :quantity, presence: true
end
