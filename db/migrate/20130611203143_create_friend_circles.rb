class CreateFriendCircles < ActiveRecord::Migration
  def change
    create_table :friend_circles do |t|
      t.integer :creator_id
      t.string :category_name

      t.timestamps
    end
  end
end
