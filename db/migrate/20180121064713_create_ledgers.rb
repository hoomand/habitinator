class CreateLedgers < ActiveRecord::Migration[5.1]
  def change
    create_table :ledgers do |t|
      t.integer :goal_id
      t.decimal :value
      t.date :entry_date

      t.timestamps
    end
  end
end
