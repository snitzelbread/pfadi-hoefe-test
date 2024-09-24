class Archive < ApplicationRecord
  has_many_attached :documents
  has_many_attached :images
end
