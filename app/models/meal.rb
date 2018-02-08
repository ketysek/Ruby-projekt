class Meal < ApplicationRecord
  enum kind: [ :appetizer, :soup, :main, :sweet ]
  
  validates :title, presence: true, uniqueness: true
  validates :kind, :price, presence: true

  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :alergens
  has_and_belongs_to_many :menus
end
