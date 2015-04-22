class Exercise < ActiveRecord::Base
  belongs_to :track, inverse_of: :exercises
  belongs_to :exercisable, polymorphic: true, inverse_of: :exercise
  has_many :achievements, as: :achievable, dependent: :destroy, inverse_of: :achievable

  validates_presence_of :description, :difficulty, :duration, :title, :track
  validates :difficulty, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  after_destroy :destroy_exercisable # Not very pretty but it avoids circular "dependent: :destroy" issues.

  ADMIN_PERMITTED_PARAMS = [:id, :description, :difficulty, :duration, :title, :track_id, :exercise_type]

  def type
    exercisable_type == Mcq.name ? exercisable.class.name.underscore : exercisable_type.underscore
  end

  def is_achieved?(user)
    self.achievements.where(user: user).present?
  end

  private

  def destroy_exercisable
    exercisable.destroy if exercisable && !exercisable.destroyed?
  end
end
