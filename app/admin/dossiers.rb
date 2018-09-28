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

  permit_params :name, :description, :image

  index do
    actions defaults: false do |dossier|
      item dossier.id, admin_dossier_documents_path(dossier)
    end

    column :name
    column :description
    column :created_at

    actions
  end


  form do |f|
    inputs do
      input :name, required: true
      input :description, required: true
      input :image, as: :file, required: true
      actions
    end
  end

  show do
    attributes_table do
      row :name
      row :description
      row :image do |dossier|
        image_tag url_for(dossier.image)
      end
    end
  end

end
