class CreateHistoryProblems < ActiveRecord::Migration[5.1]
  def change
    create_table :history_problems do |t|
      t.integer :problem_id
      t.belongs_to :user
      t.boolean :correct

      t.timestamps
    end
  end
end
