object false

total_count = 0
all_categories = Spree::Taxon.categories
@menu_products.each do |index, menu_day|
  total_count += menu_day[:total_count]
  child(menu_day[:products] => menu_day[:date]) do
    extends "spree/api/products/show"
  end
  node(:menu_id) { menu_day[:id] }
end

node(:total_count){ total_count }
node(:categories){ all_categories }
