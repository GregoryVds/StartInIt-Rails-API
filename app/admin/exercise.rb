ActiveAdmin.register Exercise do
  menu priority: 4
  permit_params :difficulty, :duration, :title, :track_id, :exercise_type

  index do
    selectable_column
    id_column
    column :track
    column :title
    column :difficulty
    column :duration
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :difficulty, as: :select, collection: (1..5)
      f.input :duration
      f.input :title
      f.input :track
      f.input :exercise_type, as: :select, collection: Exercise.exercise_types.keys
    end
    f.actions 
  end
end