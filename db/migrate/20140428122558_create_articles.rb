class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :summary
      t.text :content
      t.string :image
      t.string :image_alt
      t.string :slug
      t.date :date
      t.boolean :display

      t.timestamps
    end
  end
end
