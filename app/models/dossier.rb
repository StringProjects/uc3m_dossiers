class Dossier < ApplicationRecord
  has_many :documents
  
  has_one_attached :image
end
