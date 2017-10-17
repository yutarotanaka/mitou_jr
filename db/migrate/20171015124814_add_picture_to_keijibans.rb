class AddPictureToKeijibans < ActiveRecord::Migration
  def change
    add_column :keijibans, :picture, :string
  end
end
