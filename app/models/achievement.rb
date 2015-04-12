class Achievement < ActiveRecord::Base
  belongs_to :user
  belongs_to :achievable, polymorphic: true, inverse_of: :achievements
  validates_presence_of [:user, :achievable]
end