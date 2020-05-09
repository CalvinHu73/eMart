class Follow < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :category, uniqueness: { scope: :user }
  validates :user, presence: true
  validates :category, presence: true
end
