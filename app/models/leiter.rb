class Leiter < ApplicationRecord
  has_many :hocks
  has_one_attached :image
  has_secure_password
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :pfadiname, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true
  validate :unique_stufenleitung_for_stufe, if: -> { funktion == 'Stufenleitung' }
  validate :unique_global_funktionen, if: -> { ['Stv. Abteilungsleitung', 'Abteilungsleitung'].include?(funktion) }

  private

  def unique_global_funktionen
    if Leiter.where(funktion: funktion).where.not(id: id).exists?
      errors.add(:funktion, "#{funktion} kann es nur einmal geben.")
    end
  end
  def unique_stufenleitung_for_stufe
    if Leiter.where(funktion: 'Stufenleitung', stufe: stufe).where.not(id: id).exists?
      errors.add(:funktion, "Stufenleitung can only be assigned to one Leiter per stufe")
    end
  end
end
