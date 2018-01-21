class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.integer :category_id
      t.string :name
      t.date :end_target
      t.decimal :frequency
      t.integer :period
      t.boolean :archived
      t.boolean :new_entry_add_to_total

      t.timestamps
    end
  end
end
