module Spree
  class MenuProductDay < Spree::Base
    belongs_to :menu
    belongs_to :product

    validates :menu_id, :product_id, presence: true, numericality: { only_integer: true }
    validate :valid_menu?, :valid_product?

    delegate :name, to: :product

    scope :products_of_the_day, ->(date) { where(day: date) }
    scope :menu_products, ->(menu) { where(menu_id: menu) }

    private

    def valid_menu?
      errors.add(:menu_id, "doesn't exist") unless Spree::Menu.exists? menu_id
    end

    def valid_product?
      errors.add(:product_id, "doesn't exist") unless Spree::Product.exists? product_id
    end
  end
end
