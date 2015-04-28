class Track < ActiveRecord::Base
  has_many :exercises, dependent: :destroy, inverse_of: :track
  has_many :achievements, as: :achievable, dependent: :destroy, inverse_of: :achievable
  validates_presence_of :description, :difficulty, :name
  validates :difficulty, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  def achievements_count(user)
    Exercise.where(track_id: id).joins(:achievements).where("achievements.user_id = ?", user.id).count
  end
end
