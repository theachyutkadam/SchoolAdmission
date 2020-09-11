class RemoveAddressableFromAddress < ActiveRecord::Migration[6.0]
  def change
    remove_column :addresses, :addressable_type
    remove_column :addresses, :addressable_id
    add_reference :addresses, :user, references: :user, index: true
  end
end