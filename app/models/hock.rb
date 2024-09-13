class Hock < ApplicationRecord
  belongs_to :leiter
  validates :title, presence: true
  validates :description, presence: true
  validates :datetime, presence: true
  validates :ort, presence: true
  validates :stufe, presence: true
  validates :leiter_id, presence: true
  def pfadiname_of_leiter
    leiter.pfadiname if leiter.present?
  end
end
