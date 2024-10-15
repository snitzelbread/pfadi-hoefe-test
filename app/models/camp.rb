class Camp < ApplicationRecord
  belongs_to :leader
  has_many_attached :images
end
