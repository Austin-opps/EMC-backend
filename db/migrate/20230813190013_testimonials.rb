class Testimonials < ActiveRecord::Migration[7.0]
  def change
    create_table :testimonials do |t|
      t.string :message
      t.belongs_to :product, foreign_key: true

      t.timestamps
    end
  end
end
