class AddDonwloadLinkToDossier < ActiveRecord::Migration[5.2]
  def change
    add_column :dossiers, :donwload_link, :string, default: ''
  end
end
