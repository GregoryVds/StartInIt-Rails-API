class AddExerciseDataPolymorphicRefToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :exercise_data_type, :string
    add_column :exercises, :exercise_data_id, :integer
  end
end
