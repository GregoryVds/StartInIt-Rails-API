class AddShortDescriptionToExercise < ActiveRecord::Migration
  def change
    add_column :exercises, :short_description, :text
  end
end
