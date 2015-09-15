class AddUploadedByColumnToSongs < ActiveRecord::Migration
  def change
    change_table :songs do |t|
      t.integer :points
    end
  end
end
