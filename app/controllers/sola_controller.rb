class SolaController < ApplicationController
  def index
    @sola = Camp.where("name = ?", "Sommerlager").first
    @title_image = @sola.image if @sola.present? && @sola.image.attached?
  end
end
