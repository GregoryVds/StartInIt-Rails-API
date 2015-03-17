class CreateBinaryAnswer < ActiveRecord::Migration
  def change
    create_table :binary_answers do |t|
      t.string  :exercisable_type
      t.integer :exercisable_id
      t.boolean :value
      t.text :description
      t.timestamps 
    end
  end
end