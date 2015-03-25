class CreateLogicOutput < ActiveRecord::Migration
  def change
    create_table :logic_outputs do |t|
      t.belongs_to :logic
      t.integer :value
      t.timestamps
    end
  end
end
