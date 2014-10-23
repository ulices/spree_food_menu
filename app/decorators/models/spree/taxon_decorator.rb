Spree::Taxon.class_eval do
  scope :categories, -> { find_by(name: 'Categories').children }
end