class CreateActionQuotes < ActiveRecord::Migration
  def change
    create_table :action_quotes do |t|
      t.text :content
      t.boolean :display

      t.timestamps
    end
  end
end
