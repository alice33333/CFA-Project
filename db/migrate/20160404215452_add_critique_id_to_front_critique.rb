class AddCritiqueIdToFrontCritique < ActiveRecord::Migration
  def change
    add_column :front_critiques, :critiqueId, :integer
  end
end
