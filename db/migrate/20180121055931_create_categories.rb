class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.integer :user_id
      t.string :name
      t.integer :unit_type
      t.string :unit_name

      t.timestamps
    end
  end
end
