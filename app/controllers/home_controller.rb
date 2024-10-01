class HomeController < ApplicationController
  before_action :detect_device
  def index
    @closest_biber_hock = Hock.closest_hock_by_stufe("Biber").first
    @closest_woelfli_hock = Hock.closest_hock_by_stufe("Wölfli").first
    @closest_pfadi_hock = Hock.closest_hock_by_stufe("Pfadi").first

    @latest_articles = Article.latest_articles.first(2)
  end


  private

  def detect_device
    browser = Browser.new(request.user_agent, accept_language: "en-us") # Create a new browser instance with the user agent
    if browser.device.mobile? || browser.device.tablet?
      request.variant = :mobile
    else
      request.variant = :desktop
    end
  end
end