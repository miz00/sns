class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin_check, :boolean, null: false, default: false 
  end
end