class CreateDicChapters < ActiveRecord::Migration[5.1]
  def change
    create_table :dic_chapters do |t|
      t.string :name
      t.belongs_to :dic_subject, index: true

      t.timestamps
    end
  end
end
