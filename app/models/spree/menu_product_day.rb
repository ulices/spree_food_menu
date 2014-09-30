module Spree
  class MenuProductDay < Spree::Base
    belongs_to :menu
    belongs_to :product

    delegate :name, to: :product

    scope :products_of_the_day, ->(date) { where(day: date) }

  end
end
