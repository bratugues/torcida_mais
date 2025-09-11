class AddBarFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :bar_name, :string
    add_column :users, :bar_address, :string
  end
end
