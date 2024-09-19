class Parent < ApplicationRecord
  has_secure_password
  validates :email, presence: true
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true
end
