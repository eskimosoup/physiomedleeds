class AddRichSnippetDataToSeoEntries < ActiveRecord::Migration
def change
    add_column :seo_entries, :item_reviewed, :string
    add_column :seo_entries, :rating, :decimal, precision: 4, scale: 1
    add_column :seo_entries, :max_rating, :integer
    add_column :seo_entries, :number_of_reviews, :integer
  end
end
