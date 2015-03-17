class CreateMcqs < ActiveRecord::Migration
  def change
    create_table :mcqs do |t|
      t.timestamps
      t.string :type
    end
  end
end