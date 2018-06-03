class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.text :address
      t.string :province
      t.text :description
      t.integer :house_owner
      t.string :house_status
      t.integer :renting_price

      t.timestamps
    end
  end
end
