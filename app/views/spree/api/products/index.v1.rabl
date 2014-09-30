object false

@menu_products.each do |index, menu_day|
  child(menu_day[:products] => menu_day[:date]) do
    extends "spree/api/products/show"
  end
end
