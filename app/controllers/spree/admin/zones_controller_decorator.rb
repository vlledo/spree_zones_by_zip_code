module Spree
  module Admin
    ZonesController.class_eval do
      before_filter :load_zip_codes, except: [:index]

      protected
      
      def load_zip_codes
        @zip_codes = ZipCode.order(:value)
      end

    end
  end
end
