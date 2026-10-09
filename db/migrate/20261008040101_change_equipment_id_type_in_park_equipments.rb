class ChangeEquipmentIdTypeInParkEquipments < ActiveRecord::Migration[8.0]
  def change
    change_column :park_equipments, :equipment_id, :bigint
  end
end
