class Article < ApplicationRecord
  has_many_attached :images
  has_rich_text :content
  validates :title, presence: true
  validates :content, presence: true
  validates :date, presence: true

  scope :latest_articles, -> { where("date <= ?", Date.today).order(date: :desc) }
end
