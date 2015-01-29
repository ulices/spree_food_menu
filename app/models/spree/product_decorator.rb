Spree::Product.class_eval do
  has_many :menu_product_days, dependent: :destroy

  before_create :add_default_availability

  def add_default_availability
    self.available_from = '08:00' if self.available_from.nil?
    self.available_to = '18:00' if self.available_to.nil?
  end
end
