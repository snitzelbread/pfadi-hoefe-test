class Camp < ApplicationRecord
  belongs_to :leader
  has_many_attached :images

  validates :name, presence: true
  validates :general_description, presence: true
  validates :template, presence: true
  validates :leader, presence: true
end
