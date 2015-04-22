ActiveAdmin.register TuringMachine do
  menu priority: 8, label: "TuringMachine Exercises"
  permit_params exercise_attributes: Exercise::ADMIN_PERMITTED_PARAMS, turing_tests_attributes: [:id, :tape, :answer, :direction, :final_state, :symbols, :max_states, :max_steps, :_destroy]

  index do
    selectable_column
    id_column
    column :exercise
    actions
  end

  show do
    render 'admin/exercises/show', object: turing_machine
    render 'admin/turing_tests/index', object: turing_machine
    active_admin_comments
  end


  form do |f|
    f.semantic_errors

    inputs 'Base information' do

      f.object.build_exercise if f.object.exercise.blank?
      f.semantic_fields_for :exercise do |exercise|
        exercise.inputs do
          exercise.input :track
          exercise.input :title
          exercise.input :difficulty, as: :select, collection: (1..5)
          exercise.input :duration
          exercise.input :description
          exercise.input :short_description
        end
      end
    end

    inputs 'Turing tests' do
      f.has_many :turing_tests do |test|
        test.input :tape
        test.input :answer
        test.input :direction
        test.input :final_state
        test.input :symbols
        test.input :max_states
        test.input :max_steps
        test.input :_destroy, as: :boolean
      end
    end

    f.actions
  end

end
