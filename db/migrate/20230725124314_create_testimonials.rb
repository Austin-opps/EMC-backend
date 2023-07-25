class CreateTestimonials < ActiveRecord::Migration[7.0]
  def change
    create_table :testimonials do |t|
      t.string :message
      t.integer :user_id

      t.timestamps
    end
  end
end
