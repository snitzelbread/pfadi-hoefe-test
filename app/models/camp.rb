class Camp < ApplicationRecord
  belongs_to :leader
  has_many_attached :images
  has_rich_text :this_camp_description

  validates :name, presence: true
  validates :general_description, presence: true
  validates :template, presence: true
  validates :leader, presence: true
end
