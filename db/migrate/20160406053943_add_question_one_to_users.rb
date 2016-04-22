class AddQuestionOneToUsers < ActiveRecord::Migration
  def change
    add_column :users, :question_one, :float, default: 0.0
  end
end
