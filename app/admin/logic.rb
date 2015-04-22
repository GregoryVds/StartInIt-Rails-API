ActiveAdmin.register Logic do
  menu priority: 6, label: "Logic Exercises"
  permit_params :inputs, :max_gates, exercise_attributes: Exercise::ADMIN_PERMITTED_PARAMS, logic_outputs_attributes: [:id, :value, :_destroy]

  index do
    selectable_column
    id_column
    column :inputs
    column :max_gates
    column :exercise
    actions
  end

  show do
    render 'admin/exercises/show', object: logic

    attributes_table do
      row :inputs
      row :max_gates
    end

    render 'admin/logic_outputs/index', object: logic

    active_admin_comments
  end


  form do |f|
    f.semantic_errors

    inputs 'Base information' do
      input :inputs
      input :max_gates

      f.object.build_exercise if f.object.exercise.blank?

      render 'admin/exercises/form', exercise: f.object
      #
      # f.semantic_fields_for :exercise do |exercise|
      #   exercise.inputs do
      #     exercise.input :track
      #     exercise.input :title
      #     exercise.input :difficulty, as: :select, collection: (1..5)
      #     exercise.input :duration
      #     exercise.input :short_description
      #     exercise.input :description
      #   end
      # end
    end

    inputs 'Outputs' do
      f.has_many :logic_outputs do |output|
        output.input :value
        output.input :_destroy, as: :boolean
      end
    end

    f.actions
  end

end
