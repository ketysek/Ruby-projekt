class CreateJoinTableAlergenMeal < ActiveRecord::Migration[5.1]
  def change
    create_join_table :alergens, :meals do |t|
      # t.index [:alergen_id, :meal_id]
      # t.index [:meal_id, :alergen_id]
    end
  end
end
