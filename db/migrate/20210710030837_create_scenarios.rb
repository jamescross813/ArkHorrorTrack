class CreateScenarios < ActiveRecord::Migration[6.1]
  def change
    create_table :scenarios do |t|
      t.belongs_to :game, null: false, foreign_key: true
      t.string :title
      t.integer :order_number
      t.boolean :completion_status
      t.integer :run_number

      t.timestamps
    end
  end
end
