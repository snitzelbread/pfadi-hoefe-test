class Kleider < ApplicationRecord
  has_one_attached :image
  validates :name, :description, :image, :price, presence: true
end
