class CreateCharacterBases < ActiveRecord::Migration[6.1]
  def change
    create_table :character_bases do |t|
      t.string :name
      t.integer :health
      t.integer :sanity
      t.integer :willpower
      t.integer :intellect
      t.integer :combat
      t.integer :agility
      t.string :category
      t.string :title

      t.timestamps
    end
  end
end
