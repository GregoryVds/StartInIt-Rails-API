class CreateHelpLinks < ActiveRecord::Migration
  def change
    create_table :help_links do |t|
        t.string :exercisable_type
        t.integer :exercisable_id
        t.string :url
        t.string :description
        t.timestamps
    end
  end
end
