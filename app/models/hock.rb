class Hock < ApplicationRecord
  belongs_to :leader
  has_rich_text :description
  has_one_attached :document
  validates :title, :description, :datetime, :end_time, :ort, :stufe, :leader_id, presence: true

  scope :closest_hock_by_stufe, ->(stufe) { where("stufe = ? AND datetime > ?", stufe, Time.zone.now).order(:datetime) }
  scope :all_stufen_hocks, ->(stufe) { where("stufe = ?", stufe).order(:datetime) }

  def pfadiname_of_leader(leader_id)
    leader = Leader.find_by(id: leader_id)
    leader.pfadiname if present?
  end

  validate :datetime, -> { errors.add(:datetime, "kann nicht in der Vergangenheit liegen") if datetime.present? && datetime < Time.zone.now }
  validate :end_time, -> { errors.add(:end_time, "kann nicht in der Vergangenheit liegen") if end_time.present? && end_time < Time.zone.now }
end
