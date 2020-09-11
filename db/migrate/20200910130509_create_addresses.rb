class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references(:country, null: false, type: :bigint)
      t.references(:state, null: false, type: :bigint)
      t.references(:district, null: false, type: :bigint)
      t.references(:taluka, null: false, type: :bigint)
      t.string :pincode
      t.references :addressable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
