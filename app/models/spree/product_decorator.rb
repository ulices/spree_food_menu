Spree::Product.class_eval do
  has_many :menu_product_days, dependent: :destroy
end
