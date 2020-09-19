class RemoveMinutesFromEntries < ActiveRecord::Migration[6.0]
  def change
    remove_column :entries, :minutes, :integer
  end
end
