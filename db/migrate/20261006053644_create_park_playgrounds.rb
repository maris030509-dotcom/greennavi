class CreateParkPlaygrounds < ActiveRecord::Migration[8.0]
  def change
    create_table :park_playgrounds do |t|
      t.references :park, null: false, foreign_key: true
      t.references :playground, null: false, foreign_key: true

      t.timestamps
    end
  end
end
