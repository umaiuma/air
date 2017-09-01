class CreateMeters < ActiveRecord::Migration[5.1]
  def change
    create_table :meters do |t|
      t.belongs_to :user, index:true
      t.string :pattern_name
      t.string :chapter_name
      t.string :pattern_name
      t.float :score
      t.float :combo
      t.float :sign
      t.timestamps
    end
  end
end
