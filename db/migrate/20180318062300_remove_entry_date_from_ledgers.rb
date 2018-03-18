class RemoveEntryDateFromLedgers < ActiveRecord::Migration[5.1]
  def change
    remove_column :ledgers, :entry_date, :date
  end
end
