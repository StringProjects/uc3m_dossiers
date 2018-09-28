ActiveAdmin.register Document do
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

  belongs_to :dossier

  filter :name
  filter :description
  filter :created_at

  permit_params :name, :description, :image

  form do |f|
    inputs do
      input :dossier, as: :hidden
      input :name, required: true
      input :description, required: true
      input :image, as: :file, required: true
      actions
    end
  end

  index as: :grid, columns: 5 do |document|
    link_to image_tag(document.image), admin_dossier_document_path(document.dossier, document)
  end

  controller do
    def scoped_collection
      end_of_association_chain.where(dossier_id: params[:dossier_id])
    end
  end

end
