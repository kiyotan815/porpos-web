class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :comment
      t.references :portfolio, foreign_key: true
      t.references :user, foreign_key:true
      t.timestamps
    end
    add_index :comments, [:portfolio_id, :created_at]
  end
end
