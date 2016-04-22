class DropFrontTable < ActiveRecord::Migration
  def up
    drop_table :fronts
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
