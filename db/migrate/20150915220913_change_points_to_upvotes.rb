class ChangePointsToUpvotes < ActiveRecord::Migration
  def change
    change_table :songs do |t|
      t.string :uploaded_by
      t.remove :points
      t.integer :up_votes
    end
  end
end
