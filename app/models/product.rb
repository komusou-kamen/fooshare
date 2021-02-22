class Product < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 500 }
  validates :name, presence: true, length: { maximum: 30 }
end
