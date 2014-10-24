object @menu_product_day
attributes :product_id, :menu_id, :day, :name
child(:product => :product) do
  extends "spree/api/products/show"
end