class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.belongs_to :game, null: false, foreign_key: true
      t.belongs_to :character_base, null: false, foreign_key: true
      t.integer :victory_points_gained
      t.integer :victory_points_used
      t.integer :health
      t.integer :sanity

      t.timestamps
    end
  end
end
