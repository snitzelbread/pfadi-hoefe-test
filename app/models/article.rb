class Article < ApplicationRecord
  belongs_to :leader
  has_one_attached :image
  acts_as_taggable_on :tags
  has_rich_text :content
  validates :title, presence: true
  validates :content, presence: true
  validates :date, presence: true
  validates :image, presence: true

  scope :latest_articles, -> { where("date <= ?", Date.today).order(date: :desc) }
end
