class ChangeValueToBeIntInLedgers < ActiveRecord::Migration[5.1]
  def change
    change_column :ledgers, :value, :integer
  end
end
