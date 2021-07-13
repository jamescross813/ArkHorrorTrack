class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.belongs_to :scenario, null: false, foreign_key: true
      t.string :title 
      t.text :content

      t.timestamps
    end
  end
end
