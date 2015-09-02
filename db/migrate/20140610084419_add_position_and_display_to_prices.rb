class AddPositionAndDisplayToPrices < ActiveRecord::Migration
  def change
    add_column :prices, :position, :integer
    add_column :prices, :display, :boolean
  end
end
