class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user
  enum evaluations: { one: 1, two: 2, three: 3, four: 4, five: 5 }
  validates :evaluation, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: { maximum: 500 }
  validates_uniqueness_of :book_id, scope: :user_id
end
