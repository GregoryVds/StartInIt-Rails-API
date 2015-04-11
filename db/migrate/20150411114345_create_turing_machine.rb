class CreateTuringMachine < ActiveRecord::Migration
  def change
    create_table :turing_machines do |t|
      t.timestamps
    end
  end
end
