class AddColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :name, :string, null: false
  end
end
