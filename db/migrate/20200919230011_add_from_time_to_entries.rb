class AddFromTimeToEntries < ActiveRecord::Migration[6.0]
  def change
    add_column :entries, :from_time, :time
  end
end
