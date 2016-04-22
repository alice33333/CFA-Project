class DropFrontCritiqueTable < ActiveRecord::Migration
   def up
    drop_table :front_critiques
   end
  
  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
