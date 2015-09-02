class CreateBodyPartSections < ActiveRecord::Migration
  def change
    create_table :body_part_sections do |t|
      t.references :body_part
      t.string :name
      t.text :content
      t.boolean :display, :default => true
      t.integer :position, :default => 0
      t.string :slug

      t.timestamps
    end
    add_index :body_part_sections, :body_part_id
  end
end
