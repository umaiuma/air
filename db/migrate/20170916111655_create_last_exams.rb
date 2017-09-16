class CreateLastExams < ActiveRecord::Migration[5.1]
  def change
    create_table :last_exams do |t|
      t.integer :exam_id
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
