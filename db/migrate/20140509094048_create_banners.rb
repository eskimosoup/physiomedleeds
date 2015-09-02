class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :title
      t.text :content
      t.string :snippet
      t.string :link
      t.string :image
      t.boolean :display, :default => true
      t.integer :position, :default => 0
      t.string :link_text

      t.timestamps
    end
  end
end
