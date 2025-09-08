class CreateMatches < ActiveRecord::Migration[7.1]
  def change
    create_table :matches do |t|
      t.string :title
      t.datetime :played_at
      t.string :team_1
      t.string :team_2

      t.timestamps
    end
  end
end
