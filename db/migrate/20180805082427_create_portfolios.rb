class CreatePortfolios < ActiveRecord::Migration[5.1]
  def change
    create_table :portfolios do |t|
      t.string :title, null: false
      t.text :description
      t.text :URL
      t.text :git_URL
      t.string :catcheye_img
      t.boolean :release, default: true
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :portfolios, [:user_id, :created_at]
  end
end
