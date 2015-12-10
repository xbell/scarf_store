class ProductOption < ActiveRecord::Base
  belongs_to :product

  validates :name, presence: true
  validates :price_in_cents, presence: true

end
