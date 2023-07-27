class UpdateTableProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :quantity, :integer
    add_column :products, :admin_id, :integer
  end
end
