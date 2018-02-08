class CreateJoinTableMealMenu < ActiveRecord::Migration[5.1]
  def change
    create_join_table :meals, :menus do |t|
      # t.index [:meal_id, :menu_id]
      # t.index [:menu_id, :meal_id]
    end
  end
end
