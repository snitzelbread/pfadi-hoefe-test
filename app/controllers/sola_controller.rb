class SolaController < ApplicationController
  def index
    @sola = Camp.where("name = ?", "Sommerlager").first
    @title_image = @sola.images.first if @sola.images.attached?
  end
end
