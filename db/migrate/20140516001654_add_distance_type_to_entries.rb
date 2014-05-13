class AddDistanceTypeToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :distance_type, :integer, default: 0
  end
end
