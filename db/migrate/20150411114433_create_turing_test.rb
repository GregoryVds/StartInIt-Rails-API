class CreateTuringTest < ActiveRecord::Migration
  def change
    create_table :turing_tests do |t|
      t.belongs_to :turing_machine
      t.string :tape
      t.string :answer
      t.integer :direction
      t.integer :final_state
      t.timestamps
    end
  end
end
