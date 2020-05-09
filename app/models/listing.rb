class Listing < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :item_name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  has_one_attached :listing_img

  require 'link_thumbnailer'
  require 'open-uri'

  def self.blank
    open("http://homepages.neiu.edu/~nchaudhr/Frames/images/gray.jpg")
  end

  def link_title
    @thumb = LinkThumbnailer.generate(link)
    @thumb.title
  end

  def link_description
    @thumb = LinkThumbnailer.generate(link)
    @thumb.description
  end

end
