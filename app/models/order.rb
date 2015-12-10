class Order < ActiveRecord::Base
  has_many :items

  validates :quantity, presence: true

end
