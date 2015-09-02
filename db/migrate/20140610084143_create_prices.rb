class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.string :title
      t.text :price
      t.text :content
      t.string :image

      t.timestamps
    end
  end
end
