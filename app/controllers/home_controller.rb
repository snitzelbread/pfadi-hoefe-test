class HomeController < ApplicationController
  include CalendarHelper
  # before_action :detect_device

  def index
    @closest_biber_hock = Hock.closest_hock_by_stufe("Biber").first
    @closest_woelfli_hock = Hock.closest_hock_by_stufe("Wölfli").first
    @closest_pfadi_hock = Hock.closest_hock_by_stufe("Pfadi").first

    @latest_article = Article.latest_articles.first

    @home_calendars = calendar_with_these_names(Calendar::HOME_CALENDARS)
  end
end
