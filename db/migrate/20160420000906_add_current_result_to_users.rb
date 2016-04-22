class AddCurrentResultToUsers < ActiveRecord::Migration
  def change
    add_column :users, :current_one, :float
  end
end
