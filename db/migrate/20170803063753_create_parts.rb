class CreateParts < ActiveRecord::Migration[5.1]
  def change
    create_table :parts do |t|
      t.belongs_to :pattern, index: true
      t.belongs_to :problem, index: true

      t.timestamps
    end
  end
end
