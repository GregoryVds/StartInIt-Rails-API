ActiveAdmin.register RadioButton do
  menu priority: 5, label: "Radio Button Exercises"
  # menu label: "RadioButton exercises"

  permit_params :description, exercise_attributes: [:difficulty, :duration, :title, :track_id, :exercise_type, :_destroy]
  
  index do
    selectable_column
    id_column
    column :description
    column :exercise
    actions
  end

  show do
    # renders app/views/admin/posts/_some_partial.html.erb
    # render 'some_partial'

    attributes_table do
      row :id
      row :description
      row :created_at
      row :updated_at
    end

    active_admin_comments
  end


  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :description

      f.object.build_exercise if f.object.exercise.blank?

      f.semantic_fields_for :exercise do |exercise|
        exercise.inputs do
          exercise.input :difficulty, as: :select, collection: (1..5)
          exercise.input :duration
          exercise.input :title
          exercise.input :track
        end
      end
    end
    f.actions 
  end

end