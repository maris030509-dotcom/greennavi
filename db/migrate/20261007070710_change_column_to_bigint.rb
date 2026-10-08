class ChangeColumnToBigint < ActiveRecord::Migration[8.0]
  def change
    change_column :parks, :user_id, :bigint
    change_column :parks, :prefecture_id, :bigint

    change_column :park_equipments, :park_id, :bigint
    change_column :park_equipments, :equipment_id, :bigint

    change_column :park_playgrounds, :park_id, :bigint
    change_column :park_playgrounds, :playground_id, :bigint

    change_column :users, :prefecture_id, :bigint
  end
end
