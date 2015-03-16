class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.text :description
      t.integer :difficulty, default: 1
      t.string :name
      t.text :pre_requisites
      t.timestamps
    end
  end
end