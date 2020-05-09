class Category < ApplicationRecord
  has_many :listings, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_many :users, through: :follows
  validates :name, presence: true
end
