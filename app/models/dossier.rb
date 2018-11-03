class Dossier < ApplicationRecord
  validates_presence_of :name, :image
  
  has_one_attached :image
end
