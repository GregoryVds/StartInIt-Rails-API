ActiveAdmin.register Exercise do
  menu priority: 4, label: "All Exercises"
  permit_params :difficulty, :duration, :title, :track_id, :exercise_type

  index do
    selectable_column
    id_column
    column :track
    column "Type" do |exo|
      exo.exercisable.class.name
    end
    column :title
    column :difficulty
    column :duration
    column :created_at
    column :updated_at

    actions do |exercise|
      link_to "View", "/admin/#{exercise.exercisable_type}/#{exercise.id}", class: "member_link"
      link_to "Edit", "/admin/#{exercise.exercisable_type}/#{exercise.id}/edit", class: "member_link"
      link_to "Delete", "/admin/#{exercise.exercisable_type}/#{exercise.id}", class: "member_link", method: :delete
    end

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