class CreateProblems < ActiveRecord::Migration[5.1]
  def change
    create_table :problems do |t|
      t.string :name
      t.string :subject_name
      t.string :chapter_name
      t.string :problem_html
      t.string :solution_html
      t.integer :difficulty

      t.timestamps
    end
  end
end
