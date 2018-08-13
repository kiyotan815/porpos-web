class AddUuidToPortfolio < ActiveRecord::Migration[5.1]
  def change
    add_column :portfolios, :uuid, :string, null: false
  end
end
