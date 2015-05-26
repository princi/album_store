class CreateProfilePics < ActiveRecord::Migration
  def change
    create_table :profile_pics do |t|

      t.timestamps null: false
    end
  end
end
