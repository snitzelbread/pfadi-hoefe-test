class WolaController < ApplicationController
  def index
    @wola = Camp.where("name = ?", "Wochenlager").first
    @title_image = @wola.image if @wola.present? && @wola.image.attached?
  end
end
