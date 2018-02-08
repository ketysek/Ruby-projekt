class Alergen < ApplicationRecord
  validates :identifier, presence: true, uniqueness: true
  validates :name, presence: true

  has_and_belongs_to_many :meals
end
