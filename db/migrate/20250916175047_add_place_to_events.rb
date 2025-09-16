class AddPlaceToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :place, :string
  end
end
