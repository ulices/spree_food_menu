object false

total_count = 0
all_categories = Spree::Taxon.categories.where.not(name: ['Desayuno', 'Cafe'])
coffee_category = Spree::Taxon.find_by(name: 'Cafe')
breakfast_category = Spree::Taxon.find_by(name: 'Desayuno')
all_categories.unshift(coffee_category) if coffee_category
all_categories.unshift(breakfast_category) if breakfast_category

node(:categories) { all_categories }

@menu_products.each do |index, menu_day|
  total_count += menu_day[:total_count]
  child(menu_day[:products] => menu_day[:date]) do
    extends "spree/api/products/show"
  end
  node(:menu_id) { menu_day[:id] }
end

node(:total_count) { total_count }
