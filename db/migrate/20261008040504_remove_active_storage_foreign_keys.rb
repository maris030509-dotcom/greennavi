class RemoveActiveStorageForeignKeys < ActiveRecord::Migration[8.0]
  def change
    remove_foreign_key :active_storage_variant_records, :active_storage_blobs
  end
end
