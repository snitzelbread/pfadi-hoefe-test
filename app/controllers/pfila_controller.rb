class PfilaController < ApplicationController
  def index
    @pfila = Camp.where("name = ?", "Pfingstlager").first
    @title_image = @pfila.image if @pfila.present? && @pfila.image.attached?
  end
end
