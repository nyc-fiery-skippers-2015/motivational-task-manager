class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.integer :author_id, index: true, null: false

      t.timestamps
    end
  end
end
