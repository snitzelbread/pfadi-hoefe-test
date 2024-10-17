class Sponsor < ApplicationRecord
  has_one_attached :image
  validates :name, presence: true
  validates :image, presence: true
  validates :linky, presence: true
end
