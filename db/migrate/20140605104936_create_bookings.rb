class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.text :clinic
      t.belongs_to :treatment
      t.date :date
      t.time :time
      t.string :name
      t.string :contact_number
      t.string :email
      t.text :message

      t.timestamps
    end
    add_index :bookings, :treatment_id
  end
end
