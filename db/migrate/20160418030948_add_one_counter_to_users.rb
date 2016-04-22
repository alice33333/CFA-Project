class AddOneCounterToUsers < ActiveRecord::Migration
  def change
    add_column :users, :one_counter, :integer
  end
end
