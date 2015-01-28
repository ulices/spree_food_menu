object @product
cache [I18n.locale, @current_user_roles.include?('admin'), current_currency, root_object]

attributes :id, :name, :total_on_hand, :available_on

node(:available_from){ |product| product.available_from && product.available_from.to_s(:time) }
node(:available_to){ |product| product.available_to && product.available_to.to_s(:time) }

child master: :master do
  extends "spree/api/variants/small"
end

child taxons: :categories do
  extends "spree/api/taxons/small"
end
