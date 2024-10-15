class PfilaController < ApplicationController
  def index
    @pfila = Camp.where("name = ?", "Pfingstlager").first
    @title_image = @pfila.images.first if @pfila.images.attached?
  end
end
