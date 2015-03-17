class AddExerciseDataPolymorphicRefToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :exercisable_type, :string
    add_column :exercises, :exercisable_id, :integer
  end
end
