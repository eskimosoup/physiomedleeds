class ConvertTitleToTextOnTeamMember < ActiveRecord::Migration
  def up
    remove_column :team_members, :title
    remove_column :team_members, :name
    add_column :team_members, :qualification, :text
    add_column :team_members, :name, :text
  end

  def down
    remove_column :team_members, :qualification
    remove_column :team_members, :name
    add_column :team_members, :title, :string
    add_column :team_members, :name, :string
  end
end
