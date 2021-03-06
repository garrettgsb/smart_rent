class CreateContracts < ActiveRecord::Migration[5.0]
  def change
    create_table :contracts do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.integer :rent
      t.integer :late_fee
      t.integer :deposit
      t.references :landlord, :tenant, :property, index: true, foreign_key: true
      t.timestamps
    end
  end
end
