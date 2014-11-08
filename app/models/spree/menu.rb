module Spree
  class Menu < Spree::Base
    has_many :menu_product_days

    delegate :products_of_the_day, :menu_products, to: :menu_product_days

    scope :active_menus, -> { where(start_date: Date.today.beginning_of_week) }

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
      today = Date.today
      products = products_for(today)

      menu = {}
      menu[today.wday] = { date: today, products: products, id: id }
      menu[today.wday][:total_count] = products.count
      menu[today.wday][:categories] = Spree::Taxon.all

      menu
    end

    def products
      today = Date.today
      products = products_for_menu(id)

      menu = {}
      menu[today.wday] = { date: today, products: products, id: id }
      menu[today.wday][:total_count] = products.count
      menu[today.wday][:categories] = Spree::Taxon.all

      menu
    end

    def products_for day
      products_of_the_day(day).map(&:product)
    end

    def products_for_menu(id)
      menu_products(id).map(&:product).uniq
    end
  end
end
