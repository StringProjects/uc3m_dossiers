class Dossier < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
  
  validates_presence_of :name
end
