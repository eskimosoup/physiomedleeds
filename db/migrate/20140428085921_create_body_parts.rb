class CreateBodyParts < ActiveRecord::Migration
  def change
    create_table :body_parts do |t|
      t.string :name
      t.text :introduction
      t.string :image
      t.boolean :display, :default => true
      t.integer :position, :default => 0
      t.string :slug

      t.timestamps
    end
  end
end
