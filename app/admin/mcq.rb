ActiveAdmin.register Mcq do
  menu priority: 5, label: "MCQ Exercises"
  permit_params :type, exercise_attributes: [:description, :difficulty, :duration, :title, :track_id, :exercise_type, :_destroy], binary_answers_attributes: [:description, :value]
  
  index do
    selectable_column
    id_column
    column :type
    column :exercise
    actions
  end

  show do
    render 'admin/exercise/show', object: mcq

    attributes_table do
      row :type
    end

    render 'admin/answer/index', object: mcq

    active_admin_comments
  end

  form do |f|
    f.semantic_errors

    inputs 'Base information' do
      input :type, as: :select, collection: Mcq::TYPES

      f.object.build_exercise if f.object.exercise.blank?    
      f.semantic_fields_for :exercise do |exercise|
        exercise.inputs do
          exercise.input :track
          exercise.input :title
          exercise.input :difficulty, as: :select, collection: (1..5)
          exercise.input :duration
          exercise.input :description
        end
      end
    end

    inputs 'Answers' do
      f.has_many :binary_answers do |answers|
        answers.input :description
        answers.input :value
      end
    end

    f.actions 
  end
end