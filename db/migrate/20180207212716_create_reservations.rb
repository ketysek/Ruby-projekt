class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.integer :count
      t.references :customer, foreign_key: true
      t.references :menu, foreign_key: true

      t.timestamps
    end
  end
end
