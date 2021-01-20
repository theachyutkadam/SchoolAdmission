class DropRoleTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :roles do |t|
      t.string :name, :string
    end
  end
end
