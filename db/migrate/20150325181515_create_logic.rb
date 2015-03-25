class CreateLogic < ActiveRecord::Migration
  def change
    create_table :logics do |t|
      t.integer :inputs
      t.integer :max_gates
      t.timestamps
    end
  end
end