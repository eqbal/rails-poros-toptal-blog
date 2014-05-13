class AddStatusWethaerAndStatusLandformToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :status_weather, :string
    add_column :entries, :status_landform, :string
  end
end
