class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :image
      t.string :full_name
      t.string :email
      t.string :location
      t.string :gender

      t.timestamps
    end
  end
end
