class CreateChapters < ActiveRecord::Migration[5.1]
  def change
    create_table :chapters do |t|
      t.belongs_to :subject, index: true
      t.string :name
      t.boolean :check


      t.timestamps
    end
  end
end
