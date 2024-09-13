class HomeController < ApplicationController
      def index
        @closest_biber_hocks = Hock.where("stufe = ? AND datetime > ?", "Biber", Time.zone.now).order(:datetime).first
        @closest_woelfli_hocks = Hock.where("stufe = ? AND datetime > ?", "Wölfli", Time.zone.now).order(:datetime).first
        @closest_pfadi_hocks = Hock.where("stufe = ? AND datetime > ?", "Pfadi", Time.zone.now).order(:datetime).first
      end
end
