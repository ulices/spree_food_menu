object @product
cache [I18n.locale, @current_user_roles.include?('admin'), current_currency, root_object]

attributes :id, :name, :total_on_hand, :available_on, :available_from, :available_to

child master: :master do
  extends "spree/api/variants/small"
end

child taxons: :categories do
  extends "spree/api/taxons/small"
end
