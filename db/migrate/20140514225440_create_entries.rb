class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :user_id
      t.integer :distance
      t.integer :time_period
      t.string :date_time
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end

    add_index :entries, :user_id
    add_index :entries, :date_time
  end
end
