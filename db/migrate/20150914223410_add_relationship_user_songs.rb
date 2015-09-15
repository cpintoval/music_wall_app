class AddRelationshipUserSongs < ActiveRecord::Migration
  def change
    change_table :songs do |t|
      t.references :user
    end
  end
end
