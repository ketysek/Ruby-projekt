class Menu < ApplicationRecord
  validates :date, presence: true

  has_and_belongs_to_many :meals
  has_many :reservations
end
