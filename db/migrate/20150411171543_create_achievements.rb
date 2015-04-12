class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.references :achievable, polymorphic: true, index: true
      t.belongs_to :user
      t.timestamps
    end
  end
end
