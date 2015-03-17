class CreateRadioButtons < ActiveRecord::Migration
  def change
    create_table :radio_buttons do |t|
      t.timestamps
    end
  end
end