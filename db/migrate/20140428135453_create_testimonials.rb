class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.string :author
      t.text :content
      t.integer :position, default: 0
      t.boolean :display, default: true

      t.timestamps
    end
  end
end
