class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body, null: false
      t.belongs_to :task, null: false
      t.integer :author_id, index: true
      t.string :name, default: 'Anonymous'

      t.timestamps
    end
  end
end
