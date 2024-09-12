class Hock < ApplicationRecord
  belongs_to :leiter
  def pfadiname_of_leiter
    leiter.pfadiname if leiter.present?
  end
end
