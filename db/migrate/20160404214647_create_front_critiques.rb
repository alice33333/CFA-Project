class CreateFrontCritiques < ActiveRecord::Migration
  def change
    create_table :front_critiques do |t|
      t.float :question_one
      t.integer :question_one_total
      t.float :question_two
      t.integer :question_two_total
      t.float :question_three
      t.integer :question_three_total
      t.float :question_four
      t.integer :question_four_total
      t.integer :employee_total
      t.float :current_result
      t.integer :question_number
      t.date :critique_date

      t.timestamps null: false
    end
  end
end
