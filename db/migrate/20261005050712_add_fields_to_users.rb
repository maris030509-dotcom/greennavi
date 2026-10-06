class AddFieldsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :prefecture_id, :integer
    add_column :users, :name, :string
    add_column :users, :introduction, :text
    add_column :users, :is_active, :boolean
  end
end
