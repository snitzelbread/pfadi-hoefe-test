class HomeController < ApplicationController
      def index
        @closest_biber_hock = Hock.closest_hock_by_stufe("Biber").first
        @closest_woelfli_hock = Hock.closest_hock_by_stufe("Wölfli").first
        @closest_pfadi_hock = Hock.closest_hock_by_stufe("Pfadi").first
      end
end
