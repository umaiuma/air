class CreateChapters < ActiveRecord::Migration[5.1]
  def change
    create_table :chapters do |t|
      t.belongs_to :subject, index: true
      t.string :name
      t.integer :level
      t.boolean :onExam
      t.boolean :onStudy


      t.timestamps
    end
  end
end
