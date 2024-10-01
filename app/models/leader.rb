class Leader < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :lockable, :timeoutable, :trackable
end
