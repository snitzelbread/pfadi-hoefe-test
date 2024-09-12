class HomeController < ApplicationController
      def index
        @biber_hocks = Hock.where(stufe: "Biber").limit(3)
        @woelfli_hocks = Hock.where(stufe: "Wölfli").limit(3)
        @pfadi_hocks = Hock.where(stufe: "Pfadi").limit(3)

        # Debugging: Print out the results to ensure they are set
        Rails.logger.debug "Biber Hocks: #{@biber_hocks.inspect}"
        Rails.logger.debug "Woelfli Hocks: #{@woelfli_hocks.inspect}"
        Rails.logger.debug "Pfadi Hocks: #{@pfadi_hocks.inspect}"
      end
end
