class AddSlugToDossiers < ActiveRecord::Migration[5.2]
  def change
    add_column :dossiers, :slug, :string
    add_index :dossiers, :slug, unique: true
  end
end
