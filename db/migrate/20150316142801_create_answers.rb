class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string  :exercise_data_type
      t.integer :exercise_data_id
      t.boolean :valid
      t.text :value
      t.timestamps
    end
  end
end
