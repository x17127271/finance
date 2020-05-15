class CreateCases < ActiveRecord::Migration[6.0]
  def change
    create_table :cases do |t|
      t.integer :customer_id
      t.string :topic
      t.string :comments

      t.timestamps
    end
  end
end
