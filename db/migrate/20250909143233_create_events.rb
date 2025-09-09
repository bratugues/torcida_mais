class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :address
      t.integer :capacity
      t.float :price
      t.references :user, null: false, foreign_key: true
      t.references :match, null: false, foreign_key: true
      t.string :team

      t.timestamps
    end
  end
end
