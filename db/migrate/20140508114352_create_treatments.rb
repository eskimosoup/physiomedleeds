class CreateTreatments < ActiveRecord::Migration
  def change
    create_table :treatments do |t|
      t.string :name
      t.text :summary
      t.text :content
      t.boolean :display

      t.timestamps
    end
  end
end
