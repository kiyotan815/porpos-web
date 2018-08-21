class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.integer :user_id, null: false
      t.integer :portfolio_id, null: false

      t.timestamps

      t.index :user_id
      t.index :portfolio_id
      t.index [:user_id, :portfolio_id], unique: true
    end
  end
end
