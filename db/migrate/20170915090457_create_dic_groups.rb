class CreateDicGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :dic_groups do |t|
      t.string :name
      t.belongs_to :dic_chapter, index: true

      t.timestamps
    end
  end
end
