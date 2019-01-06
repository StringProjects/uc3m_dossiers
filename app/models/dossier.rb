class Dossier < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  validates_presence_of :name, :image

  has_one_attached :image
end
