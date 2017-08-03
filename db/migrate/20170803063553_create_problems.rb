class CreateProblems < ActiveRecord::Migration[5.1]
  def change
    create_table :problems do |t|
      t.string :name
      t.string :problem_image
      t.string :solution_image
      t.integer :difficulty

      t.timestamps
    end
  end
end
