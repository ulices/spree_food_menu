module Spree
  class Menu < Spree::Base
    has_many :menu_product_days

    delegate :products_of_the_day, to: :menu_product_days

    scope :active_menu, -> { where(start_date: Date.today.beginning_of_week).first }

    def dates_of_the_week
      (start_date..end_date).map{|date| date }
    end

    def menu_of_the_week
      week_menu = {}

      dates_of_the_week.each do |date|
        week_menu[date.wday] = { date: date, products: products_for(date) }
      end
      week_menu
    end

    def products_for day
      products_of_the_day(day).map(&:product)
    end
  end
end
