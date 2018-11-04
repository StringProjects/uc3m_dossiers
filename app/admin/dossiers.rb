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

  permit_params :name, :description, :image, :donwload_link

  filter :name
  filter :description
  filter :created_at

  index do
    actions defaults: false do |dossier|
      item dossier.id, admin_dossier_path(dossier)
    end

    column :image do |dossier|
      begin
        image_tag url_for(dossier.image), class: "dossier_index_image"
      rescue
      end
    end

    column :name
    column :created_at
    
    actions
  end

  form do |f|
    inputs do
      input :name, required: true
      input :description, required: true
      input :image, as: :file, required: true
      input :donwload_link
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
      row :image do |dossier|
        begin
          image_tag url_for(dossier.image), class: 'dossier_show_image'
        rescue
        end
      end
      
      row :donwload_link
    end
  end

end
