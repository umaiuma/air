class CreateSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects do |t|
      t.belongs_to :exam, index:true
      t.string :name
      t.boolean :onExam
      t.boolean :onStudy


      t.timestamps
    end
  end
end
