class CreateCommunities < ActiveRecord::Migration[8.0]
  def change
    create_table :communities do |t|
      t.string :name
      t.text :introduction
      t.boolean :is_active, null: false, default: true

      t.timestamps
    end
  end
end
