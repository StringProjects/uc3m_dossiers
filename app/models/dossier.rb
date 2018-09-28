class Dossier < ApplicationRecord
  has_many :documents, dependent: :destroy

  validates_presence_of :name, :image
  
  has_one_attached :image
end
