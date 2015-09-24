class CreateTrackingCodes < ActiveRecord::Migration
  def change
    create_table :tracking_codes do |t|
      t.references :trackable, polymorphic: true
      t.text :code

      t.timestamps
    end
    add_index :tracking_codes, [:trackable_id, :trackable_type]
  end
end
