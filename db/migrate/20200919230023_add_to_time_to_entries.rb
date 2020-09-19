class AddToTimeToEntries < ActiveRecord::Migration[6.0]
  def change
    add_column :entries, :to_time, :time
  end
end
