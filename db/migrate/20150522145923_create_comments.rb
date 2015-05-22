class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.belongs_to :task
      t.integer :author_id

      t.timestamps
    end
  end
end
