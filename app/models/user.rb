require 'bcrypt'

class User < ApplicationRecord

  include BCrypt

  has_many :listings, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_many :categories, through: :follows
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :password_hash, presence: true
  has_one_attached :user_img

  extend FriendlyId
  friendly_id :username, use: :slugged

  def full_name
    p "#{first_name} #{last_name}"
  end

  def feed_listing
    @feed = []
    categories.each { |cat| @feed = @feed + cat.listings }
    @feed.sort_by(&:created_at).reverse
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
  
  def self.blank
    open("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png")
  end
end
