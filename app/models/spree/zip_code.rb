module Spree
  class ZipCode < Spree::Base
    validates :value, presence: true

    def <=>(other)
      value <=> other.value
    end

    def to_s
      value
    end

    def name
      value
    end
  end
end