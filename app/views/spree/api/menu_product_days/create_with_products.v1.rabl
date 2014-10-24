object false

@response.each do |index, menu_day|
  child(menu_day[:products] => :products) do
    extends "spree/api/products/show"
   end
   node(:day) { menu_day[:day] }
end