class RemoveIndex < ActiveRecord::Migration[5.2]
  def change
    remove_index :tracks, name: "index_tracks_on_album_id_and_title_and_ord"
    add_index :tracks, [:album_id, :ord], unique: true
    remove_column :tracks, :title
    add_column :tracks, :name, :string, null: false
    remove_column :tracks, :lyrics
    add_column :tracks, :lyrics, :text, null: false
    remove_column :tracks, :regular
    add_column :tracks, :bonus, :boolean, default: false, null: false
  end
end
