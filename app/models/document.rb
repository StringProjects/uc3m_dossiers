class Document < ApplicationRecord
  belongs_to :dossier

  has_one_attached :image
end
