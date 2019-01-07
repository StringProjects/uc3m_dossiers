ActiveAdmin.register Dossier do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  menu priority: 1

  permit_params :name, :description, :url, :donwload_link, images_attributes: [:highlighted, :avatar, :id, :_destroy]

  filter :name
  filter :description
  filter :created_at

  index do
    actions defaults: false do |dossier|
      item dossier.id, admin_dossier_path(dossier)
    end

    column :name
    column :created_at
    
    actions
  end

  form do |f|
    inputs do
      input :name, required: true
      input :description, required: true
      input :slug
      input :donwload_link
    
      has_many :images, heading: false, allow_destroy: true do |ff|
        ff.input :avatar, required: true, as: :file, :hint => ff.template.image_tag(ff.object.avatar.url(:original))
        ff.input :highlighted
      end
      
      actions
    end


    script do
      raw "$(document).ready(function($) { custom_froala('#dossier_description'); })"
    end
  end

  show do
    attributes_table do
      row :name
      row :description
      row :images do |dossier|
        images = ''
        dossier.images.each do |image|
          images += image_tag image.avatar.url, class: 'dossier_show_image'
        end
        raw images
      end

      row :url do |dossier|
        dossier_url(dossier)
      end
      
      row :donwload_link
    end
  end

end
