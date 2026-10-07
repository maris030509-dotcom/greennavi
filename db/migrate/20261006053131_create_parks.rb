class CreateParks < ActiveRecord::Migration[8.0]
  def change
    create_table :parks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :prefecture, null: false, foreign_key: true
      t.string :name
      t.text :introduction
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
