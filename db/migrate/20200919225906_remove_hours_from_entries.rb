class RemoveHoursFromEntries < ActiveRecord::Migration[6.0]
  def change
    remove_column :entries, :hours, :integer
  end
end
