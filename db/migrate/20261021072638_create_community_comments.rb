class CreateCommunityComments < ActiveRecord::Migration[8.0]
  def change
    create_table :community_comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :community, null: false, foreign_key: true
      t.text :body
      t.boolean :is_active

      t.timestamps
    end
  end
end
