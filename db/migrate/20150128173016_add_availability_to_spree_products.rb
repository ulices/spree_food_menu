class AddAvailabilityToSpreeProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :available, :boolean, default: true
  end
end
