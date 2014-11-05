module Spree
  class Menu < Spree::Base
    has_many :menu_product_days

    delegate :products_of_the_day, to: :menu_product_days

    scope :active_menu, -> { where(start_date: Date.today.beginning_of_week) }

    def dates_of_the_week
      (start_date..end_date).map{|date| date }
    end

    def menu_of_the_week
      week_menu = {}

      dates_of_the_week.each do |date|
        products = products_for(date)
        week_menu[date.wday] = { date: date, products: products_for(date) }
        week_menu[date.wday][:total_count] = products.size
      end
      week_menu
    end

    def menu_of_the_day
      day_menu = {}
      date = Date.today
      products = products_for(date)
      day_menu[date.wday] = { date: date, products: products, id: id }
      day_menu[date.wday][:total_count] = products.count
      day_menu[date.wday][:categories] = Spree::Taxon.all

      day_menu
    end

    def products_for day
      products_of_the_day(day).map(&:product)
    end
  end
end
