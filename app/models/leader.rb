class Leader < ApplicationRecord
  has_many :hocks
  has_one_attached :image
  has_many :camps, foreign_key: :leader_id

  validates :email, :password, presence: true
  validate :unique_stufenleitung_for_stufe, if: -> { funktion == "Stufenleitung" }
  validate :unique_global_funktionen, if: -> { [ "Stv. Abteilungsleitung", "Abteilungsleitung" ].include?(funktion) }

  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :validatable, :lockable, :timeoutable, :trackable

  private

  def unique_global_funktionen
    if Leader.where(funktion: funktion).where.not(id: id).exists?
      errors.add(:funktion, "#{funktion} kann es nur einmal geben.")
    end
  end

  def unique_stufenleitung_for_stufe
    if Leader.where(funktion: "Stufenleitung", stufe: stufe).where.not(id: id).exists?
      errors.add(:funktion, "Stufenleitung can only be assigned to one Leader per stufe")
    end
  end
end
