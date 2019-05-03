class Book < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :price, presence: true,
    numericality: { 
      only_integer: true,
      greater_than: 1
    }
  validates :publish_date, presence: true
  validates :description, presence: true, length: { maximum: 1000 }
end