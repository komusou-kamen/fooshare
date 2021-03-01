class Product < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 500 }
  validates :name, presence: true, length: { maximum: 30 }
  validates :price, presence: true, numericality: { only_integer: true }
  mount_uploader :image, ImageUploader
  #has_one_attached :image
end
