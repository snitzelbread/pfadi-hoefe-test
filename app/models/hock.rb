class Hock < ApplicationRecord
  belongs_to :leiter
  validates :title, presence: true
  validates :description, presence: true
  validates :datetime, presence: true
  validates :ort, presence: true
  validates :stufe, presence: true
  validates :leiter_id, presence: true

  scope :closest_hock_by_stufe, ->(stufe) { where("stufe = ? AND datetime > ?", stufe, Time.zone.now).order(:datetime) }
  scope :all_stufen_hocks, ->(stufe) { where("stufe = ?", stufe).order(:datetime) }


  def pfadiname_of_leiter
    leiter.pfadiname if leiter.present?
  end
end
