class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.text :description
      t.integer :difficulty, default: 1
      t.integer :duration
      t.string :title
      t.integer :track_id
      t.string :exercisable_type
      t.integer :exercisable_id
      t.timestamps
    end
  end
end