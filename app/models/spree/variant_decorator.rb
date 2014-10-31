Spree::Variant.class_eval do
  has_many :images, -> { order('position DESC') }, as: :viewable, dependent: :destroy, class_name: 'Spree::Image'
end