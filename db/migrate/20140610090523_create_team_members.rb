class CreateTeamMembers < ActiveRecord::Migration
  def change
    create_table :team_members do |t|
      t.integer :position
      t.string :name
      t.string :title
      t.string :role
      t.text :bio
      t.string :image
      t.boolean :display

      t.timestamps
    end
  end
end
