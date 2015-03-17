class Exercise < ActiveRecord::Base
  belongs_to :track, inverse_of: :exercises
  belongs_to :exercisable, polymorphic: true, inverse_of: :exercise

  validates_presence_of :description, :difficulty, :duration, :title, :track
  validates :difficulty, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  after_destroy :destroy_exercisable # Not very pretty but it avoids circular "dependent: :destroy" issues.

  def type
    exercisable_type == Mcq.name ? exercisable.class.name.underscore : exercisable_type.underscore
  end

  private

  def destroy_exercisable
    exercisable.destroy if exercisable && !exercisable.destroyed?
  end
end