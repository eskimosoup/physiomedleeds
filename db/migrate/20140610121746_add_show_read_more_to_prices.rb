class AddShowReadMoreToPrices < ActiveRecord::Migration
  def change
    add_column :prices, :show_read_more, :boolean
  end
end
