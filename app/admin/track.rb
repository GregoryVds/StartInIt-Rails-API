ActiveAdmin.register Track do
  menu priority: 2
  permit_params :description, :difficulty, :name, :pre_requisites

  index do
    selectable_column
    id_column
    column :name
    column :difficulty
    column :description
    column :pre_requisites
    column :created_at
    column :updated_at
    actions
  end
end