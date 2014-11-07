object @product
cache [I18n.locale, @current_user_roles.include?('admin'), current_currency, root_object]

attributes *product_attributes

node(:display_price) { |p| p.display_price.to_s }

child :master => :master do
  extends "spree/api/variants/small"
end

child :taxons => :categories do
  extends "spree/api/taxons/show"
end
