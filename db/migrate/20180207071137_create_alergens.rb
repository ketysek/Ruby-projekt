class CreateAlergens < ActiveRecord::Migration[5.1]
  def change
    create_table :alergens do |t|
      t.string :name
      t.integer :identifier

      t.timestamps
    end
  end
end
