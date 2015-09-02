class AddPositionToTreatment < ActiveRecord::Migration
  def change
    add_column :treatments, :position, :integer
  end
end
