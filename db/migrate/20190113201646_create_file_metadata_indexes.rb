class CreateFileMetadataIndexes < ActiveRecord::Migration[5.2]
  def change
    add_column :file_metadata, :file_size, :bigint

    add_index :file_metadata, ["path"], name: "index_file_metadata_path", using: :btree
    add_index :file_metadata, ["file_size"], name: "index_file_metadata_file_size", using: :btree
    add_index :file_metadata, ["sha1"], name: "index_file_metadata_sha1", using: :btree
  end
end
