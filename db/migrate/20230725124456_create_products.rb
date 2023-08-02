class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.string :image
      t.belongs_to :admin
      t.string :description
      t.string :category
      t.integer :quantity
      t.timestamps
    end
  end
end
