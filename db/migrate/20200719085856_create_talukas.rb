class CreateTalukas < ActiveRecord::Migration[6.0]
  def change
    create_table :talukas do |t|
      t.string :name
      t.references :district, null: false, foreign_key: true

      t.timestamps
    end
  end
end
