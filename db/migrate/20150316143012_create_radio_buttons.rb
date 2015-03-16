class CreateRadioButtons < ActiveRecord::Migration
  def change
    create_table :radio_buttons do |t|
      t.text :description
      t.timestamps
    end
  end
end