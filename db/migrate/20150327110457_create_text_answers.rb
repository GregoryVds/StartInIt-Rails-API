class CreateTextAnswers < ActiveRecord::Migration
  def change
    create_table :text_answers do |t|
      t.belongs_to :question
      t.string :answer
      t.timestamps
    end
  end
end
