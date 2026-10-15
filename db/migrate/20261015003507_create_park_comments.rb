class CreateParkComments < ActiveRecord::Migration[8.0]
  def change
    create_table :park_comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :park, null: false, foreign_key: true
      t.text :body
      t.boolean :is_active, default: true, null: false

      t.timestamps
    end
  end
end
