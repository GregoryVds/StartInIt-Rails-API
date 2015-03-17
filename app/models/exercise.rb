class Exercise < ActiveRecord::Base
  belongs_to :track, inverse_of: :exercises
  belongs_to :exercisable, polymorphic: true, inverse_of: :exercise

  enum exercise_type: [:radio_buttons, :check_boxes, :fill_the_blank, :digital_logic]

  validates_presence_of :difficulty, :duration, :title, :track, :exercise_type
  validates :difficulty, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  after_destroy :destroy_exercisable # Not very pretty but it avoids circular "dependent: :destroy" issues.

  private

  def destroy_exercisable
    exercisable.destroy if exercisable && !exercisable.destroyed?
  end
end