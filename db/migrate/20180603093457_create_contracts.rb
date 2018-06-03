class CreateContracts < ActiveRecord::Migration[5.2]
  def change
    create_table :contracts do |t|
      t.integer :house_id
      t.integer :user_id
      t.datetime :contract_date_start
      t.datetime :contract_date_end
      t.string :contract_status

      t.timestamps
    end
  end
end
