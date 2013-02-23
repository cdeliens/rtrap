class CreateAdminPages < ActiveRecord::Migration
  def change
    create_table :admin_pages do |t|
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
