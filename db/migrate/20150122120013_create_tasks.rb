class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.boolean :completed, default: false
      t.integer :count
      t.timestamps null: false

    end
  end

end