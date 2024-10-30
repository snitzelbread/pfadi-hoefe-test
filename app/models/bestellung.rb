class Bestellung < ApplicationRecord
  has_many :kleiders

  validates :first_name, :last_name, :email, :phone, :address, :city, :zipcode, :message, presence: true
end
