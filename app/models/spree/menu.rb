module Spree
  class Menu < Spree::Base
    has_many :menu_product_days

    delegate :products_of_the_day, to: :menu_product_days

    def menu_of_the_week
      week_menu = {}

      week_menu[:monday] = { date: start_date, products: products_for(start_date) }
      week_menu[:sunday] = { date: end_date, products: products_for(end_date) }
      week_menu
    end

    def products_for day
      products_of_the_day day
    end
  end
end
