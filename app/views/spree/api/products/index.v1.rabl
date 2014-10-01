object false

total_count = 0
@menu_products.each do |index, menu_day|
  total_count += menu_day[:total_count]
  child(menu_day[:products] => menu_day[:date]) do
    extends "spree/api/products/show"
  end
end

node(:total_count){ total_count }
