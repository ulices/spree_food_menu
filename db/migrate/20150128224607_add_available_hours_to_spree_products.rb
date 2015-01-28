class AddAvailableHoursToSpreeProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :available_from, :time
    add_column :spree_products, :available_to, :time
  end
end
