module Spree
  class MenuProductDay < Spree::Base
    belongs_to :menu
    belongs_to :product

    scope :products_of_the_day, ->(date) { where(day: date) }
  end
end
