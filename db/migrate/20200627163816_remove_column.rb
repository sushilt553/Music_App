class RemoveColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :albums, :title
  end
end
