class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.integer :difficulty, default: 1
      t.integer :duration
      t.string :title
      t.integer :track_id
      t.integer :exercise_type
      t.timestamps
    end
  end
end