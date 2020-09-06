class AddColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :login_id, :integer
    add_column :users, :login_type, :string

    add_index :users, [:login_id, :login_type]
  end
end