class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.boolean :completed, default: false
      t.belongs_to :list, null: false

      t.timestamps null: false
    end
  end
end
