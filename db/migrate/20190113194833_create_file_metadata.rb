class CreateFileMetadata < ActiveRecord::Migration[5.2]
  def change
    create_table :file_metadata do |t|
      t.string :path
      t.string :sha1

      t.timestamps
    end
  end             
end
