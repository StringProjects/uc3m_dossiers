class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.references :dossier, foreign_key: true
      t.boolean :highlighted, default: false

      t.timestamps
    end

    add_attachment :images, :avatar
  end
end
