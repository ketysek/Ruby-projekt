class Comment < ApplicationRecord
  belongs_to :meal

  validates :commenter, :body, :email, presence: true
end