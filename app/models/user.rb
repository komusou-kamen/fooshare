class User < ApplicationRecord
    before_save { self.email.downcase! }
    validates :name, presence: true, length: { maximum: 20 },
                    uniqueness: { case_sensitive: false }
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
    validates :phone, presence: true, length: { minimum: 8, maximum: 20 },
                    numericality: { only_integer: true },
                    uniqueness: { case_sensitive: false }
    validates :address, presence: true, length: { maximum: 50 }
    has_secure_password
    has_many :products
    mount_uploader :image, ImageUploader
    validates :introduce, length: { maximum: 500 }
    #has_one_attached :image
end
