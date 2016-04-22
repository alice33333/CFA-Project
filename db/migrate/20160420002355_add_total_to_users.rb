class AddTotalToUsers < ActiveRecord::Migration
  def change
    add_column :users, :total_one, :float
  end
end
