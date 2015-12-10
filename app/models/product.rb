class Product < ActiveRecord::Base
  has_many :product_options

  validates :name, presence: true
  validates :description, presence: true
  validates :image_url, presence: true

  validates_associated :product_options

end
