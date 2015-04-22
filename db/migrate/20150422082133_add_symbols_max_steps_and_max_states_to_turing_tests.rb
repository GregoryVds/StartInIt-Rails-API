class AddSymbolsMaxStepsAndMaxStatesToTuringTests < ActiveRecord::Migration
  def change
    add_column :turing_tests, :symbols, :string
    add_column :turing_tests, :max_states, :integer
    add_column :turing_tests, :max_steps, :integer
  end
end
