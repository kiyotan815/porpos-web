class AddIconImgToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :icon_img, :string
  end
end
