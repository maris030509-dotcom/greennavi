class AddDefaultToCommunityCommentsIsActive < ActiveRecord::Migration[8.0]
  def change
    change_column_default :community_comments, :is_active, true
    change_column_null :community_comments, :is_active, false
  end
end
