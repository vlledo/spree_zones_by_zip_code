module Spree
  module Admin
    class ZipCodesController < ResourceController
      def collection
        super.order(:value)
      end
    end
  end
end