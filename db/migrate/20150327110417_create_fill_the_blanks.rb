class CreateFillTheBlanks < ActiveRecord::Migration
  def change
    create_table :fill_the_blanks do |t|
      t.timestamps
    end
  end
end
