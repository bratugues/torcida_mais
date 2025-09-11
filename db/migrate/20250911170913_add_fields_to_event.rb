class AddFieldsToEvent < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :description, :text
    add_column :events, :date, :datetime
  end
end
