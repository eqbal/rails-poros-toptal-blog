class ChangeDistanceToFloat < ActiveRecord::Migration
  def change
  	change_column :entries, :distance, :float
  end
end
