class ChangeTeamsToReferencesInMatches < ActiveRecord::Migration[7.1]
  def change
    remove_column :matches, :team_1, :string
    remove_column :matches, :team_2, :string
    add_reference :matches, :home_team, null: false, foreign_key: { to_table: :clubs }
    add_reference :matches, :away_team, null: false, foreign_key: { to_table: :clubs }
  end
end
