class CreatePatterns < ActiveRecord::Migration[5.1]
  def change
    create_table :patterns do |t|
      t.string :name
      t.belongs_to :chapter, index:true

      t.timestamps
    end
  end
end
