class CreateSpreeMenus < ActiveRecord::Migration
  def change
    create_table :spree_menus do |t|
      t.integer :version
      t.date :start_date
      t.date :end_date

      t.timestamps
    end

    add_index :spree_menus, :version
  end
end
