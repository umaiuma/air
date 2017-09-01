class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.belongs_to :chapter, index:true
      t.string :name
      t.float :level


      t.timestamps
    end
  end
end
