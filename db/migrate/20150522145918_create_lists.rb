class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title, null: false
      t.string :url
      t.integer :author_id, null: false

      t.timestamps
    end
  end
end
